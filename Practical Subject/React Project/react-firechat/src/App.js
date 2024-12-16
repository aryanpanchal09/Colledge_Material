import React, { useState, useEffect } from 'react'; // Import hooks here
import Button from './components/Button';
import Channel from './components/Channel';
import Messages from './components/Message';

// Firebase deps 
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';

firebase.initializeApp({
  apiKey: "AIzaSyCNFuju29C9b_DDUBoJ2n6uHwKxKtqsdJ0",
  authDomain: "react-firechat-eb096.firebaseapp.com",
  projectId: "react-firechat-eb096",
  storageBucket: "react-firechat-eb096.firebasestorage.app",
  messagingSenderId: "617137488131",
  appId: "1:617137488131:web:b3246648c7a5c83baaa936",
});

const auth = firebase.auth();
const db = firebase.firestore();

function App() {
  const [user, setUser] = useState(() => auth.currentUser);
  const [initializing, setInitializing] = useState(true);

  useEffect(() => {
    const unsubscribe = auth.onAuthStateChanged(user => {
      if (user) {
        setUser(user);
      } else {
        setUser(null);
      }
      if (initializing) {
        setInitializing(false);
      }
    });

    return unsubscribe;
  }, [initializing]);

  const signInWithGoogle = async () => {
    const provider = new firebase.auth.GoogleAuthProvider();
    auth.useDeviceLanguage();
    try {
      await auth.signInWithPopup(provider); // Updated method name
    } catch (error) {
      console.log(error);
    }
  };

  const signOut = async () => {
    try {
      await firebase.auth().signOut();
    } catch (error) {
      console.log(error.message);
    }
  };

  if (initializing) return 'Loading ...';

  return (
    <div>
      {user ? (
        <>
          <Button onClick={signOut}>Sign out</Button>
          <Channel user={user} db={db} />
          <p>Welcome to the Chat</p>
        </>
      ) : (
        <Button onClick={signInWithGoogle}>Sign In With Google</Button>
      )}
    </div>
  );
}

export default App;
