-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 10:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `remas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `avatars`
--

CREATE TABLE `avatars` (
  `id` int(11) NOT NULL,
  `avatar_name` varchar(255) DEFAULT NULL,
  `avatar_image` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `avatars`
--

INSERT INTO `avatars` (`id`, `avatar_name`, `avatar_image`, `cost`) VALUES
(1, 'Space Explorer', 'explorer.png', 50),
(2, 'Astronaut', 'astronaut.png', 100),
(3, 'Alien', 'alien.png', 150),
(4, 'Robot', 'robot.png', 200),
(5, 'Cosmic Warrior', 'warrior.png', 300),
(6, 'default avatar', 'default_avatar.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE `coins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coins_earned` int(11) DEFAULT 0,
  `coins_spent` int(11) DEFAULT 0,
  `balance` int(11) DEFAULT 0,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level_number` int(11) NOT NULL,
  `level_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `total_sessions` int(11) DEFAULT 12
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level_number`, `level_name`, `description`, `total_sessions`) VALUES
(7, 1, 'Introduction to Universe', 'Astronomy is one of the most dynamic fields in all of science. There are new discoveries almost daily in the areas of exoplanets, black holes, distant galaxies, and cosmology.', 6);

-- --------------------------------------------------------

--
-- Table structure for table `planets`
--

CREATE TABLE `planets` (
  `id` int(11) NOT NULL,
  `planet_name` varchar(255) DEFAULT NULL,
  `planet_image` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planets`
--

INSERT INTO `planets` (`id`, `planet_name`, `planet_image`, `cost`) VALUES
(1, 'Earth', 'earth.png', 100),
(2, 'Mars', 'mars.png', 150),
(3, 'Jupiter', 'jupiter.png', 200),
(4, 'Saturn', 'saturn.png', 250),
(5, 'Neptune', 'neptune.png', 300),
(6, 'no planet', 'no.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `correct_answer_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `level_id`, `quiz_name`, `total_questions`, `correct_answer_count`, `created_at`) VALUES
(12, 7, 'Level 1 Quiz', 10, 0, '2024-10-01 08:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `attempt_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_attempts`
--

INSERT INTO `quiz_attempts` (`id`, `user_id`, `quiz_id`, `attempt_date`) VALUES
(7, 4, 11, '2024-09-30 21:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `quiz_id`, `question_text`, `correct_answer`, `option_a`, `option_b`, `option_c`, `option_d`) VALUES
(15, 12, 'What is one of the main drivers of excitement in astronomy?', 'New discoveries driven by technology', 'Ancient theories', 'New discoveries driven by technology', 'Personal experiences', 'Cultural beliefs'),
(16, 12, 'How long is the course mentioned in the passage?', 'Six weeks', 'Four weeks', 'Six weeks', 'Seven weeks', 'Three weeks'),
(17, 12, 'What is NOT a focus of the course?', 'The theory of evolution', 'The theory of evolution', 'Robotic probes studying the Solar System', 'Historical cultural beliefs about the universe', 'Techniques for building large telescopes'),
(18, 12, 'What is the nature of the content in the course?', 'Conceptually high-level and non-mathematical', 'Highly mathematical', 'Only practical applications', 'Focused on ancient texts', 'Conceptually high-level and non-mathematical'),
(19, 12, 'How is evidence gathered in astronomy?', 'Through direct observation and electromagnetic radiation', 'Through laboratory experiments', 'By mathematical calculations', 'Through direct observation and electromagnetic radiation', 'By personal beliefs'),
(20, 12, 'What is the primary role of imagination in science, according to the passage?', 'To combine disparate elements for new discoveries', 'To combine disparate elements for new discoveries', 'To create artistic expressions', 'To develop mathematical skills', 'To analyze existing theories'),
(21, 12, 'Which artist is mentioned as an example of combining elements to create something new?', 'Pablo Picasso', 'Vincent van Gogh', 'Claude Monet', 'Pablo Picasso', 'Salvador Dalí'),
(22, 12, 'What does the term \"contra-factual\" refer to in the context of science?', 'Things that could be true but are not currently observed', 'Theories that have been proven wrong', 'Things that could be true but are not currently observed', 'Established scientific facts', 'Imagination in art'),
(23, 12, 'What is one example of \"impossible music\" mentioned in the passage?', 'X Cannon by Conlon Nancarrow', 'Classical symphonies', 'Jazz improvisation', 'X Cannon by Conlon Nancarrow', 'Folk songs'),
(24, 12, 'What historical figure\'s work is cited as an early example of visualizing space travel?', 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Johannes Kepler', 'Isaac Newton'),
(25, 12, 'What historical figure\'s work is cited as an early example of visualizing space travel?', 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Johannes Kepler', 'Isaac Newton'),
(26, 12, 'What historical figure\'s work is cited as an early example of visualizing space travel?', 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Johannes Kepler', 'Isaac Newton'),
(27, 12, 'What historical figure\'s work is cited as an early example of visualizing space travel?', 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Johannes Kepler', 'Isaac Newton');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `session_number` int(11) NOT NULL,
  `content` text NOT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `coins_awarded` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `level_id`, `session_number`, `content`, `is_completed`, `user_id`, `completed_at`, `coins_awarded`) VALUES
(38, 7, 1, 'First Session: Vision   \r\n\r\nAstronomy starts with vision. That\'s not just because optical Astronomy is still the primary way we learn about the universe, but because we have to see the universe. Astronomy is based on observation as is most science. It\'s how we see the universe with our eyes or with telescopes. And astronomy, like most scientists starts with observations of patterns and the natural world. That\'s something that\'s built into everyone. Humans are built to recognize patterns, whether it was a way of avoiding predation when we were hunter gatherers or a way of identifying food sources with the changing seasons. We\'re built to recognize patterns. We\'re really good at it. It has a survival mechanism, and it helps us a scientist to. It\'s important in astronomy and in science in general to see the world as it actually is. In this pair of images, we\'ll see a medieval view of how a cannon ball travels, and this is based on Aristotle\'s mistaken idea. From Greek philosophy of the 5th century BC where an object does not have rest as a natural state of motion. And we can see the completely unnatural trajectory of the cannonball based on physics that was essentially wrong. Moving forward to Leonardo\'s painting of a cannonball trajectory, we see the parabolic arc that later is described beautifully by Newton\'s law of gravity. In this example, the artist, Leonardo, correctly portrays the trajectory of the cannon ball based on observation, even though he had no theory of gravity to guide him. The example of Leonardo reminds us that centuries ago there was not the artificial distinction between science and the arts that there is now, which is unfortunate in my opinion. Leonardo was a polymath who worked equally in the worlds of science, engineering, and math. Another example perhaps less familiar as an artist was Galileo. He published his beautiful water color and charcoal drawings of the moon and the things he saw through the telescope. Because again, remember this was before photography, before electronic detectors. All you could record is what you saw with your eye. And recording it exquisitely with a painting is one way of doing that. So, in Galileo\'s drawings of the moon, we see the topographical features that told Galileo this was another rocky world like the Earth. A very important part of the history of ideas, leading to the fact that the Earth is not unique. When we talk about vision we can extend this to include other senses too. One modern technique and science involves sonification or turning visual or numerical data into sounds. It\'s one way of understanding the patterns in nature. This was done by Kepler, who is the first to understand planetary orbits. He talked about the harmony of the spheres, by which he meant he planetary orbit could be converted into a varying tone based on the frequency of the orbital period and its perspective as viewed from the off-centered position of the earth. In this audio version of that, we hear the harmony of the spheres as successive planets are introduced with lower and lower tones moving out from the sun.\r\n', 0, NULL, NULL, 0),
(39, 7, 2, 'Second Session: Discovery \r\n\r\nOne of the exciting things about science is discovery. The fact that many important things about astronomy were never predicted by a theory or anticipated by astronomers before they made the observations. We never predicted the existence of dark energy, dark matter, or black holes. But we\'ve observed these things, and we\'ve observed extraordinary things in the universe that were based on surprises to people looking at the world in new ways. As a metaphor and an analogy for discovering nature, let\'s look at sequences of cards. Regular playing cards with the face cards taken out, so just the number cards. It\'s a toy model, but it meaningfully captures some of the essence of how science works. You\'re gonna see four different sequences of cards, and the goal in this little game is to decide what is the rule that governs how these cards were laid down. What is the pattern in nature? In this case, the pattern in a numbered series of cards of four different suits that describes what\'s going on. The first example is obvious. I don\'t need any explanation for me, it\'s just a numbered sequence of the same suit. The rule is obvious. The second pattern is a little more interesting; it\'s an alternating red and black sequence. But notice here that some information is important—the alternating red and black sequence—and some information is irrelevant. The actual numbers of the cards or the difference between the two red and the two black suits. This is a lesson that in nature and in science, it\'s not obvious what the most important information is when we seek a pattern and don\'t yet understand it. But now look at the third and fourth patterns, and see if you can decide before I give away the answer what is the rule that governs how these cards were laid down\r\n', 0, NULL, NULL, 0),
(40, 7, 3, 'Third Session: Imagination \r\n\r\nImagination is an important part of how science works. You may be surprised—you may have thought that science depended on the protean skills of people doing mathematics or chunking through equations. Perhaps for people who don\'t like math, that can be a little boring. But science is very exciting because creativity and imagination are built-in at the core. That\'s how we learn about new things and new aspects of the universe that we never anticipated. My favorite example of imagination is how you can take two disparate things or two disparate pieces of information and combine them to find something new or surprising. In this example from the artist Pablo Picasso early in his career, he combines two routine elements of a rusty old bike—the seat and the handlebars—to make a completely new image of a bull. It\'s surprising and delightful. The same feeling comes to scientists when they invent a new theory that explains disparate data sets.\r\n\r\nAnother reason imagination is important in science is that it can take us to places that we can\'t yet venture with our telescopes or our spacecraft or our instruments because we have the power to imagine the impossible or the power to imagine things that could be but aren\'t. There\'s an idea in science called the contra-factual. That is, things that could be true that don\'t violate any law of nature or physics but are not apparently true—they\'ve never yet been observed. Sometimes we can test our theories or ideas by imagining contra-factuals—things that we don\'t actually observe but could be true. That\'s an interesting hypothetical and imaginary way to do science. In the end, of course, we do need observations to prove or disprove our theories. Continuing our analogies in the arts, here are some examples of impossible things that can be visualized by artists. They look like real physical objects but cannot actually be constructed\r\n', 0, NULL, NULL, 0),
(41, 7, 4, 'Fourth Session: Reasoning\r\n\r\nReasoning is a very important part of the scientific method. It involves how we use observations of the natural world and combine them to form structures or theories that explain a large range of phenomena. Humans are unusual in their powers of reasoning—perhaps not unique, as other sentient animals might also possess intelligence—but humans have elevated reasoning to an entirely new level. While science is only a few thousand years old and civilization around 10,000 years old, humans have had the power of reasoning for much longer. The last detectable anatomical changes in humans or their brain chemistry date back to about 40,000 years ago, when humans were hunter-gatherers and nomads in Africa, even before they ventured into other continents. A human alive then had the same cognitive capabilities that we do now, and yet they lived in a simple world without the tools of technology or science. What did they imagine about the world using the same brain they had then, that we have now?\r\n\r\nThe formal ideas of reasoning began with the Greek philosophers, especially Aristotle, who profoundly influenced physics, astronomy, mathematics, and many other fields. Aristotle developed the rules of deductive logic, which still hold today. These rules were further codified by Bertrand Russell in the 20th century. Aristotle\'s deductive logic defines how science combines statements about the natural world to draw conclusions and make inferences. However, deductive reasoning can sometimes fail, and it is important to question the premises on which the reasoning is based. Logic, after all, is just a tool—it cannot determine the truth of the premises themselves. If the assumptions are faulty or not justified by data, then the reasoning fails\r\n', 0, NULL, NULL, 0),
(42, 7, 5, 'Fifth Session: Uncertainty and Measurements\r\n\r\nLet\'s talk about uncertainty, and its related concept error. You might think that science has got nothing to do with uncertainty or error. Science should be about knowing things and being sure of things, and indeed scientists are confident about many of the theories they have and are very accurate in many of the observations they make. But scientists are always wanting to be aware of the limitations of their theories and the limitations of their data. So good science depends on understanding uncertainty and error. These concepts are distinguishable. Uncertainty involves inevitable, uncertainty involve with the measuring apparatus, the theoretical framework for an observation, or the physical universe itself. An error is something a little different. Usually when scientists talk about an error they\'re not talking about mistakes as we might do in everyday life, they\'re telling you about errors associated with measurements or observations, that are to do with limitations of the measuring apparatus or the telescope site. So we can distinguish these two things. They\'re built into science and they\'re completely unavoidable. Science is never perfect, and science is never absolutely confident 100 percent of its conclusions. This level of contingency is unavoidable and it\'s not a problem, it just means we move towards greater certainty and we must always pay attention to the errors. Astronomy is in a particular situation within the fields of science, because astronomy does not work as a laboratory with direct control of the experiment. Experiments astronomy take place trillions of miles away at the minimum, that\'s one light year. So astronomy is based on remote situations and remote sensing of those situations. As a result, the uncertainties in astronomy or perhaps larger than in other scientific fields or laboratories involved. In some situations in astronomy, we are quite unsure especially in a new regime. We talk about an order of magnitude uncertainty, which means a factor of 10. The answer could be 10 times smaller or 10 times larger than our first guess. This seems almost like we don\'t know anything at all, but in a new regime and in a universe that spans dozens of orders of magnitude of scale sometimes this is where we start. As astronomers refine their measurements, in many cases they\'re quite happy with a factor of two or 50% uncertainty. For an observation such as the number of stars in a galaxy or the size of a star, this is a reasonable estimate it can tell us quite a lot. It\'s hard to do much better. In many fields of astronomy something with 10 percent precision or accuracy is is about as good as we can get. Remember, we\'re dealing with limited amounts of information from objects that are very faint or very far away, and so 10% or 5% percent accuracy such as for the expansion rate of the universe involves an enormous amount of work even to reach this level. These are the realms of accuracy in astronomy, and we are gradually moving towards precision. There are some measurements in astrophysics where the accuracy is a percent or two, the edge of the earth for example is known with a precision of less than one percent. We can talk in general about three different forms of uncertainty or limitations that occur in science, in all fields of science not just astronomy. The most important and perhaps the trickiest to diagnose is the conceptual limitation of science, for example, we might make a false premise about a theory or an observation. We might confuse causation with correlation, something we\'ll talk about more, or are powerful pattern recognition apparatus might lead us to infer a pattern where none actually exists. Remember, we\'re conditioned to do this, if we were hunter-gatherers and we thought we saw a pattern of a leopard hiding in the underbrush and we were wrong, then we just got a fright. If we didn\'t see the leopard when the leopard was there we were lunch. So we\'re built to recognize patterns very powerfully, and sometimes in science this can lead us astray\r\n', 0, NULL, NULL, 0),
(43, 7, 6, 'Sixth Session: Causation and Correlation \r\n\r\nSo I\'ve talked about the formal aspects of correlation, how we measure observations, and look for relationships between parameters or variables. But what about the underlying issue that we\'re trying to explain? This is the confusion between causation and correlation, a profound issue in science that has led to famous mistakes in history. Correlation does not imply causation—i.e., cause and effect explained by a physical theory.\r\n\r\nFor example, consider the relationship between average temperature and the number of pirates. Higher temperatures correlate with more pirates, but does heat create pirates, or are there just more pirate activities in warmer regions? This correlation tells us nothing about the underlying relationship.\r\n\r\nBertrand Russell shared a story about a chicken on a farm. Every morning, the sun rises, and the farmer scatters seed, leading the chicken to correlate the sunrise with being fed. However, one morning, the farmer kills the chicken, demonstrating a catastrophic failure of logic from confusing correlation with causation\r\n', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `coins` int(11) DEFAULT 0,
  `avatar` varchar(100) DEFAULT 'default_avatar.png',
  `planet` varchar(100) DEFAULT 'no.png',
  `levels_completed` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_admin` tinyint(1) DEFAULT NULL,
  `current_streak` int(11) DEFAULT 0,
  `longest_streak` int(11) DEFAULT 0,
  `last_activity` date DEFAULT NULL,
  `last_session_date` date DEFAULT NULL,
  `sessions_completed_today` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `coins`, `avatar`, `planet`, `levels_completed`, `created_at`, `is_admin`, `current_streak`, `longest_streak`, `last_activity`, `last_session_date`, `sessions_completed_today`) VALUES
(3, 'Mohamed Ehab', 'mohamed@test.com', '25f9e794323b453885f5181f1b624d0b', 0, 'default_avatar.png', 'no.png', 0, '2024-09-30 18:02:01', 1, 0, 0, NULL, NULL, 0),
(4, 'Test User', 'test@test.com', '25f9e794323b453885f5181f1b624d0b', 2500, 'astronaut.png', 'neptune.png', 6, '2024-09-30 18:22:57', 1, 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_avatars`
--

CREATE TABLE `user_avatars` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `avatar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_avatars`
--

INSERT INTO `user_avatars` (`id`, `user_id`, `avatar_id`) VALUES
(1, 4, NULL),
(2, 4, NULL),
(3, 4, NULL),
(4, 4, NULL),
(5, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_planets`
--

CREATE TABLE `user_planets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `planet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_planets`
--

INSERT INTO `user_planets` (`id`, `user_id`, `planet_id`) VALUES
(1, 4, NULL),
(2, 4, NULL),
(3, 4, NULL),
(4, 4, NULL),
(5, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_quizzes`
--

CREATE TABLE `user_quizzes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avatars`
--
ALTER TABLE `avatars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planets`
--
ALTER TABLE `planets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`quiz_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_avatars`
--
ALTER TABLE `user_avatars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `avatar_id` (`avatar_id`);

--
-- Indexes for table `user_planets`
--
ALTER TABLE `user_planets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `planet_id` (`planet_id`);

--
-- Indexes for table `user_quizzes`
--
ALTER TABLE `user_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`quiz_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avatars`
--
ALTER TABLE `avatars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coins`
--
ALTER TABLE `coins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `planets`
--
ALTER TABLE `planets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_avatars`
--
ALTER TABLE `user_avatars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_planets`
--
ALTER TABLE `user_planets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_quizzes`
--
ALTER TABLE `user_quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coins`
--
ALTER TABLE `coins`
  ADD CONSTRAINT `coins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`);

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`);

--
-- Constraints for table `user_avatars`
--
ALTER TABLE `user_avatars`
  ADD CONSTRAINT `user_avatars_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_avatars_ibfk_2` FOREIGN KEY (`avatar_id`) REFERENCES `avatars` (`id`);

--
-- Constraints for table `user_planets`
--
ALTER TABLE `user_planets`
  ADD CONSTRAINT `user_planets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_planets_ibfk_2` FOREIGN KEY (`planet_id`) REFERENCES `planets` (`id`);

--
-- Constraints for table `user_quizzes`
--
ALTER TABLE `user_quizzes`
  ADD CONSTRAINT `user_quizzes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_quizzes_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
