SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`) VALUES
(1, 'Adidas', '', 1),
(2, 'Allensolly', '', 1),
(3, 'Calvin Klein', '', 1),
(4, 'Nike', '', 1),
(5, 'PUMA', '', 1),
(6, 'VAN HEUSEN', '', 1),
(7, 'ZARA', '', 1),
(8, 'NULL', '', 1);

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`) VALUES
(1, 'Women', 'Women ware', 1),
(2, 'Accessories', 'Men and Women Accessories', 1),
(3, 'Men', 'Men ware', 1),
(4, 'Kids', 'Kids ware', 1);

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`) VALUES
(1, 'Tatva', 'Shah', 'Male', '6351508591', 'shahtatva118@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Sample Address');

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`,`date_updated`) VALUES
(1, 1, 15, 1500, NULL),
(2, 4, 20, 3500, NULL),
(3, 3, 25, 5000, NULL),
(4, 2, 20, 3500, NULL),
(5, 6, 40, 3000, NULL),
(6, 8, 10, 3500, NULL),
(7, 7, 60, 1500, NULL),
(8, 9, 100, 4500, NULL);

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`) VALUES
(1, 1, 'LIMBDI', 'Online Payment', 1, 1500, 1, 1),
(2, 1, 'Sample Address', 'cod', 1, 5000, 0, 0),
(3, 1, 'LIMBDI', 'cod', 1, 1500, 0, 0);

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(1, 1, 1, 1, 1500, 1500),
(2, 2, 3, 1, 5000, 5000),
(3, 3, 1, 1, 1500, 1500);

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `name`, `specs`, `status`) VALUES
(1, 1, 3, 1, 'Adidas men t-shirts', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1),
(2, 8, 1, 11, 'Women waer', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1),
(3, 8, 2, 2, 'Tital watch', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1),
(4, 8, 3, 1, 'SOJANYA', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1),
(9, 1, 2, 15, 'adidas Mens Drogo M Running Shoe', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1),
(6, 8, 1, 11, 'Kutri', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1),
(7, 8, 4, 3, 'boy kid', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1),
(8, 8, 4, 3, 'girl kid', '<p>     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos ducimus esse aspernatur nemo corrupti? Adipisci praesentium iure magni! Maxime numquam delectus praesentium ipsa rem cum dignissimos iusto nihil. Quam, esse.lor     Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia eligendi tenetur, maxime dolorum id maiores hic vel nesciunt eum, quam doloremque, delectus earum rerum excepturi! Accusamus est et esse totam?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam amet, commodi obcaecati expedita quo tempore nihil autem aliquid dolores temporibus quam aliquam, veniam sequi? Molestiae libero impedit necessitatibus velit numquam!     Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente velit, dicta pariatur possimus, ut inventore laboriosam animi fugit ullam adipisci accusamus voluptatum nihil enim quod alias magnam iure, excepturi est?     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus magnam necessitatibus beatae ex, omnis ullam sit illo doloremque corporis asperiores reiciendis accusantium eos, impedit possimus corrupti velit aspernatur quasi quisquam. </p>', 1);

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`) VALUES
(1, 1, 6500),
(2, 2, 5000),
(3, 3, 1500);
--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`) VALUES
(1, 3, 'Clothing', '', 1),
(2, 2, 'Watches', '', 1),
(3, 4, 'Cloth', '', 1),
(4, 2, 'Sunglasses', '', 1),
(5, 2, 'Jewellery', '', 1),
(6, 2, 'Handbags', '', 1),
(7, 2, 'Wallets', '', 1),
(8, 3, 'T-shirts', '', 1),
(9, 3, 'Jeans', '', 1),
(10, 3, 'Shirts', '', 1),
(11, 1, 'clothing', '', 1),
(12, 1, 'Western Wear', '', 1),
(13, 1, 'Ethnic Wear', '', 1),
(14, 1, 'Night Wear', '', 1),
(15, 2, 'Shoes', '', 1);

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Shopping System'),
(2, 'short_name', 'Online Shopping'),
(3, 'logo', 'uploads/1.png'),
(4, 'user_avatar', 'uploads/user_avatar.jpg'),
(5, 'cover', 'uploads/5.jpeg');

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`) VALUES
(1, 'Tatva', 'Shah', 'tatva', 'd8f27fec93ba8a3e5c75ae3a67be89a3', 'uploads/3.jpeg', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

