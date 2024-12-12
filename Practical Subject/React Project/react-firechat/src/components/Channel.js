import React, { useState, useEffect } from 'react';
import firebase from 'firebase/compat/app';
import Message from './Message';

const Channel = ({ user = null, db = null }) => {
    const [messages, setMessages] = useState([]);
    const [newMessages, setNewMessages] = useState('');

    const { uid, displayName, photoURL } = user;

    useEffect(() => {
        if(db) {
            const unsubscribe = db
                .collection('messages')
                .orderBy('createdAt')
                .limit(100)
                .onSnapshot(querySnapshot => {
                    const data = querySnapshot.docs.map(doc => ({
                        ...doc.data(),
                        id: doc.id,
                    }));
                    setMessages(data);
                });

            return unsubscribe;
        }
        }, [db]);

        const handleOnChange = e => {
            setNewMessages(e.target.value);
        };

        const handleOnSubmit = e => {
            e.preventDefault();

            if (db) {
                db.collection('messages').add({
                    text: newMessages,
                    createdAt: firebase.firestore.FieldValue.serverTimestamp(),
                    uid,
                    displayName,
                    photoURL
                })
            }
        }

        return (
            <>
            <ul>
                {messages.map(message => (
                    <li key={message.id}>
                        <Message { ...message} />
                    </li>
                ))}
            </ul>
            <form onSubmit={handleOnSubmit}>
                <input
                    type="text"
                    value={newMessages}
                    onChange={handleOnChange}
                    placeholder="Type your message here..."
                />
            <button type="submit" disabled={!newMessages}>
                Send
            </button>
            </form>
            </>
        );
    };

export default Channel;