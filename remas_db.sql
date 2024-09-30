-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2024 at 08:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

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
(4, 1, 'Intro to Universe', 'Astronomy is one of the most dynamic fields in all of science. There are new discoveries almost daily in the areas of exoplanets, black holes, distant galaxies, and cosmology. This excitement is driven by technology that\'s enabling a new generation of large telescopes on the ground and in space. The quest to understand our place in the universe is as old as humanity itself. So join us and experience the thrill of astronomy!', 9),
(5, 2, 'Second Level : Continue with Universe', 'continue learning about the universe and space.', 7);

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
(17, 4, 1, 'First Session: Vision \r\nAstronomy starts with vision. That\'s not just because optical Astronomy is still the primary way we learn about the universe, but because we have to see the universe. Astronomy is based on observation as is most science. It\'s how we see the universe with our eyes or with telescopes. And astronomy, like most scientists starts with observations of patterns and the natural world. That\'s something that\'s built into everyone. Humans are built to recognize patterns, whether it was a way of avoiding predation when we were hunter gatherers or a way of identifying food sources with the changing seasons. We\'re built to recognize patterns. We\'re really good at it. It has a survival mechanism, and it helps us a scientist to. It\'s important in astronomy and in science in general to see the world as it actually is. In this pair of images, we\'ll see a medieval view of how a cannon ball travels, and this is based on Aristotle\'s mistaken idea. From Greek philosophy of the 5th century BC where an object does not have rest as a natural state of motion. And we can see the completely unnatural trajectory of the cannonball based on physics that was essentially wrong. Moving forward to Leonardo\'s painting of a cannonball trajectory, we see the parabolic arc that later is described beautifully by Newton\'s law of gravity. In this example, the artist, Leonardo, correctly portrays the trajectory of the cannon ball based on observation, even though he had no theory of gravity to guide him. The example of Leonardo reminds us that centuries ago there was not the artificial distinction between science and the arts that there is now, which is unfortunate in my opinion. Leonardo was a polymath who worked equally in the worlds of science, engineering, and math. Another example perhaps less familiar as an artist was Galileo. He published his beautiful water color and charcoal drawings of the moon and the things he saw through the telescope. Because again, remember this was before photography, before electronic detectors. All you could record is what you saw with your eye. And recording it exquisitely with a painting is one way of doing that. So, in Galileo\'s drawings of the moon, we see the topographical features that told Galileo this was another rocky world like the Earth. A very important part of the history of ideas, leading to the fact that the Earth is not unique. When we talk about vision we can extend this to include other senses too. One modern technique and science involves sonification or turning visual or numerical data into sounds. It\'s one way of understanding the patterns in nature. This was done by Kepler, who is the first to understand planetary orbits. He talked about the harmony of the spheres, by which he meant he planetary orbit could be converted into a varying tone based on the frequency of the orbital period and its perspective as viewed from the off-centered position of the earth. In this audio version of that, we hear the harmony of the spheres as successive planets are introduced with lower and lower tones moving out from the sun.\r\n\r\nKepler didn\'t originate the idea of the harmony of the spheres, it was an ancient Greek idea that came from Pythagoras. Pythagoras had a profound influence on all the scientists and philosophers who came afterwards. Saying for example that the universe was based on number. And in modern science we believe this. We believe the mathematical, numerical theories underlying nature. Pythagoras also talked about the harmony of the spheres. He thought that this celestial music was such that only enlightened people could actually hear it. In this second example, we dramatically hear what the entire universe might have sounded like in the first 10,000 years after the big bang. This is the sonification of the interactions of matter and radiation in the infinite universe when the temperature was thousands, perhaps a millions of degrees. We hear the ringing of the universe as these oscillating waves and particles interact with each other. Remember, this is the pre-cursor state to a vast and ancient universe that eventually would contain a 100 billion galaxies. This work was done by Mark Whittle at the University of Virginia. That\'s dramatic example when we compress 10,000 years into a bad sense seconds and because the audible range of the true physics is 42 octaves below what we could hear, we up shifted to come into the audible range. Vision is how we learn about at the universe. In astronomy, initially, it was with the eyes, and then with telescopes and electronic detectors. Vision also extends to other senses, and to other parts of the electromagnetic spectrum. Vision and this kind of data is how we learn about the universe.\r\n', 0, NULL, NULL, 0),
(18, 4, 2, 'Second Session: Discovery \r\n\r\nOne of the exciting things about science is discovery. The fact that many important things about astronomy were never predicted by a theory or anticipated by astronomers before they made the observations. We never predicted the existence of dark energy, dark matter, or black holes. But we\'ve observed these things, and we\'ve observed extraordinary things in the universe that were based on surprises to people looking at the world in new ways. As a metaphor and an analogy for discovering nature, let\'s look at sequences of cards. Regular playing cards with the face cards taken out, so just the number cards. It\'s a toy model, but it meaningfully captures some of the essence of how science works. You\'re gonna see four different sequences of cards, and the goal in this little game is to decide what is the rule that governs how these cards were laid down. What is the pattern in nature? In this case, the pattern in a numbered series of cards of four different suits that describes what\'s going on. The first example is obvious. I don\'t need any explanation for me, it\'s just a numbered sequence of the same suit. The rule is obvious. The second pattern is a little more interesting; it\'s an alternating red and black sequence. But notice here that some information is important—the alternating red and black sequence—and some information is irrelevant. The actual numbers of the cards or the difference between the two red and the two black suits. This is a lesson that in nature and in science, it\'s not obvious what the most important information is when we seek a pattern and don\'t yet understand it. But now look at the third and fourth patterns, and see if you can decide before I give away the answer what is the rule that governs how these cards were laid down.\r\n\r\nYou can see it\'s a little subtle. There do appear to be sequences or patterns embedded in that layering of cards, but it\'s not obvious. By trying to imagine the rule, you are doing what a scientist does. You\'re developing a hypothesis and testing it against nature, in this case, a sequence of cards, and you\'re using a small sequence of the data to see if your prediction matches what comes later. Immediately, you\'re testing a feature of science where we have to understand how much data is needed to test the hypothesis. We\'re also seeing another aspect of science where possibly, more than one hypothesis can explain the same set of data. Looking at those last two sequences of cards, C and D, it\'s quite possible that more than one simply stated rule governs the sequences. This is partly why astronomers argue about theories. Sometimes it\'s not obvious what the best theory is, or there\'s not a unique theory at all. The rule—or rather I should say, one rule—that governs sequence C is, when you play successive cards you\'re either matching the color or the number of the card. That\'s a very simple rule stated in only a few words. But notice how subtle a pattern of cards it makes. A rule that describes the fourth card sequence is that a red card is placed on top of an even-numbered card and a black card is placed on an odd-numbered card. Again, it\'s a very simple rule stated in only a few words and it produces a surprisingly subtle pattern of cards in sequence. When you stare at the sequences cold without any idea of what\'s going on, you can see how difficult it is to elicit the rule or the underlying law of nature, if you like, that describes these sequences. So this is just a cartoon example, but it does illustrate many of the features of the scientific method. The periodic table is an excellent example of patterns in nature and how science works. The first notion of a periodic table came from the Greek philosopher, Empedocles, almost 250 years ago. Empedocles came up with the idea that everything in nature—all the material substances of the Earth, the atmosphere, and even human beings—were made of four essential elements: earth, air, fire, and water.\r\n\r\nThe combinations of those four fundamental elements produced the diversity of the material world. That\'s an extraordinary idea, but it\'s the basis of modern chemistry. Flash forward almost 2,000 years, and we have made a lab, doing simple experiments and drawing the skeleton of the modern periodic table. Where the associations and the properties of similar elements eventually give us the idea that those elements have physical underpinnings. It\'s not until the modern atomic theory that we truly understand the periodic table. But the patterns in nature, the similarities between reactive elements, metals, and noble gases, is the basis of understanding how the atom works. The idea of discovery leads to a debate that\'s gone on for many centuries. The distinction between what is invented in science and what is discovered. Is science a product of the human mind and imagination? Or is it purely the discovery of things that exist in nature that we—and maybe other creatures elsewhere in the universe—can understand? This is an interesting debate, and artists and scientists have often found themselves intriguingly on opposite sides of the debate. We might imagine that, like Newton, we are dissecting the rainbow. The science is pure analysis, turning white light into its component colors, and Newton was the one who put it all together in a theory of light. So the standard view of science is that it is reductionist, that it takes complex observed phenomena and then reduces them to their simplest elements. But science also involves synthesis, and that synthesis is an important part of how we understand nature and build scientific theories. As an example from the artistic side, consider Michelangelo, who wrote poetry and sonnets and is known as a scientist and an engineer. We might imagine that an artist is imposing their will on a canvas or a lump of marble or clay, imposing a vision of what they might imagine that to be and creating it from scratch. But that\'s not how Michelangelo saw it. He talked about roaming around the northern Italian towns where the marble was quarried, Carrara, and he would scramble over the hillside looking for a piece where he saw something hidden in the rock that he could liberate through his talent. That\'s an unusual view of art—that there\'s something in nature in the lump of marble that he is liberating or seeing for the first time. It\'s more of a scientific idea. I think a true and nuanced view of both science and art shows that the truth is more complicated—that there is synthesis and analysis and dissection and recompiling into a whole that occurs in both fields of human endeavor. Discovery is an important and exciting part of science. Many of the things we understand about the universe were not predicted by any theory. They were completely unanticipated. So scientists must always be alert to patterns in nature, to something new and surprising that might lead them to a deeper understanding of the universe. This is true in art as in science. The whole idea of whether things are discovered or invented, and are products of the human mind, is an interesting philosophical debate that\'s never been resolved\r\n', 0, NULL, NULL, 0),
(19, 4, 3, 'Third Session: Imagination \r\n\r\nImagination is an important part of how science works. You may be surprised—you may have thought that science depended on the protean skills of people doing mathematics or chunking through equations. Perhaps for people who don\'t like math, that can be a little boring. But science is very exciting because creativity and imagination are built-in at the core. That\'s how we learn about new things and new aspects of the universe that we never anticipated. My favorite example of imagination is how you can take two disparate things or two disparate pieces of information and combine them to find something new or surprising. In this example from the artist Pablo Picasso early in his career, he combines two routine elements of a rusty old bike—the seat and the handlebars—to make a completely new image of a bull. It\'s surprising and delightful. The same feeling comes to scientists when they invent a new theory that explains disparate data sets.\r\n\r\nAnother reason imagination is important in science is that it can take us to places that we can\'t yet venture with our telescopes or our spacecraft or our instruments because we have the power to imagine the impossible or the power to imagine things that could be but aren\'t. There\'s an idea in science called the contra-factual. That is, things that could be true that don\'t violate any law of nature or physics but are not apparently true—they\'ve never yet been observed. Sometimes we can test our theories or ideas by imagining contra-factuals—things that we don\'t actually observe but could be true. That\'s an interesting hypothetical and imaginary way to do science. In the end, of course, we do need observations to prove or disprove our theories. Continuing our analogies in the arts, here are some examples of impossible things that can be visualized by artists. They look like real physical objects but cannot actually be constructed.\r\n\r\nGoing along and riding over the top of them, some music written by Conlon Nancarrow early in the 20th century called the X Cannon. It involves player pianos altered so they play notes at an impossible speed. This is not physical music. This is not music that any human could play. So it\'s imagining the impossible in music. Does this mean we can imagine it in art and in science?\r\n\r\nTwo important examples of imagination in astronomy involve the imagination of space travel or visualizing space travel hundreds of years before it was possible. Isaac Newton produced a famous diagram that shows a cannon placed on the top of a tall mountain. The cannon is pointing sideways, and it fires a cannonball at increasing speeds. As the muzzle velocity increases, the cannonball falls in a parabolic trajectory, explained by his theory of gravity. But Newton realized that if the atmosphere was thin and thus not slowing down the cannonball—in other words, there was no friction force—if you increase the speed of the cannonball, there would be a speed at which the cannonball was falling at the same rate that the Earth was curving down under it. That\'s the imagination of an orbit. The speed you get from that calculation in his theory is the orbital speed. We just needed the technology to accelerate any object to that speed, which would not happen for over 300 years. But Newton was imagining space travel.\r\n\r\nAnother example that\'s more relevant recently, as we discover exoplanets, is the work of space artists and visionaries going back a hundred or more years who\'ve imagined other worlds in space. The idea of other worlds in space—worlds like the Earth or different from it, far from view, maybe even far from telescope analysis—goes back hundreds of years. But space artists have increasingly used their talents to visualize worlds in space, similar or dissimilar to the Earth, how they might look if we could be there, what it might be like to live or explore there. This space art is helping us in our imagination. It helps propel us into the space exploration that we think will one day take us to these other worlds.\r\n\r\nAnother example from popular culture involves the imagination of wormholes or white holes. In gravity theory, these are hypothetical situations where space-time is so curved that it doubles back on itself. Essentially, we can have a portal into a completely different region of space or time by stepping through into another world. In movies, this has been portrayed several times in several ways, including recently, but the idea of a wormhole exists firmly in the theory of gravity. It\'s just a situation we don\'t know exists in the real universe, though people are, in fact, looking. The behavior of space-time in situations of intense gravity is a frontier field of research in astrophysics.\r\n\r\nImagination is extremely important in science and, in particular, in astronomy, where so few things have been predicted. We use our theories and our observations to bolster our science, but we\'re completely free to imagine situations that haven\'t yet been observed. Something called the counterfactual is something that could happen in the universe but has not yet been observed. We can test our theories and ideas by imagining such things\r\n', 0, NULL, NULL, 0),
(20, 4, 4, 'Fourth Session: Reasoning\r\n\r\nReasoning is a very important part of the scientific method. It involves how we use observations of the natural world and combine them to form structures or theories that explain a large range of phenomena. Humans are unusual in their powers of reasoning—perhaps not unique, as other sentient animals might also possess intelligence—but humans have elevated reasoning to an entirely new level. While science is only a few thousand years old and civilization around 10,000 years old, humans have had the power of reasoning for much longer. The last detectable anatomical changes in humans or their brain chemistry date back to about 40,000 years ago, when humans were hunter-gatherers and nomads in Africa, even before they ventured into other continents. A human alive then had the same cognitive capabilities that we do now, and yet they lived in a simple world without the tools of technology or science. What did they imagine about the world using the same brain they had then, that we have now?\r\n\r\nThe formal ideas of reasoning began with the Greek philosophers, especially Aristotle, who profoundly influenced physics, astronomy, mathematics, and many other fields. Aristotle developed the rules of deductive logic, which still hold today. These rules were further codified by Bertrand Russell in the 20th century. Aristotle\'s deductive logic defines how science combines statements about the natural world to draw conclusions and make inferences. However, deductive reasoning can sometimes fail, and it is important to question the premises on which the reasoning is based. Logic, after all, is just a tool—it cannot determine the truth of the premises themselves. If the assumptions are faulty or not justified by data, then the reasoning fails.\r\n\r\nThere are two fundamentally different types of logic used in science: deductive and inductive. Deductive logic, as formulated by Aristotle, involves drawing reliable conclusions if the premises are valid. For example, in astronomy, an observation that the Earth is larger than the Moon and another observation that the Sun is larger than the Earth can be combined to deduce that the Sun is larger than the Moon. Deductive reasoning is powerful but limited—it cannot provide more information than what was already present in the premises.\r\n\r\nOn the other hand, inductive logic involves generalizing from a specific set of observations to form broader conclusions. This method was most famously used by Isaac Newton in his theory of gravity. Newton used a limited set of observations from the solar system—primarily the orbits of the Earth, Moon, Sun, and visible planets—to develop his universal law of gravity. Although his observations were limited to a small number of celestial bodies, Newton confidently projected that his law would apply to other, as-yet-unobserved situations. A dramatic example of the power of induction was his prediction of the reappearance of Halley\'s Comet, named after his friend Edmond Halley. His theory accurately predicted its return, and more broadly, his law of gravity has since been found to explain the motions of stars in other galaxies and the dynamics of galaxies in the universe—despite these phenomena not being observed during Newton\'s lifetime.\r\n\r\nInductive reasoning also applies to other scientific fields. For example, Charles Darwin\'s theory of natural selection and evolution was based on a limited set of observations over a few decades. However, the mechanisms Darwin proposed in his 1859 book were inferred to apply to all species over Earth\'s history. Subsequent observations have validated his theory, demonstrating the power of induction in biology.\r\n\r\nIn summary, reasoning—particularly in the forms of deduction and induction—is foundational to science. Deductive reasoning combines specific observations to draw reliable conclusions, while inductive reasoning generalizes from limited data to broader theories. Both are essential tools in all scientific fields, enabling humans to gain new knowledge about the universe\r\n', 0, NULL, NULL, 0),
(21, 4, 5, 'Fifth Session: Uncertainty and Measurements\r\n\r\nLet\'s talk about uncertainty, and its related concept error. You might think that science has got nothing to do with uncertainty or error. Science should be about knowing things and being sure of things, and indeed scientists are confident about many of the theories they have and are very accurate in many of the observations they make. But scientists are always wanting to be aware of the limitations of their theories and the limitations of their data. So good science depends on understanding uncertainty and error. These concepts are distinguishable. Uncertainty involves inevitable, uncertainty involve with the measuring apparatus, the theoretical framework for an observation, or the physical universe itself. An error is something a little different. Usually when scientists talk about an error they\'re not talking about mistakes as we might do in everyday life, they\'re telling you about errors associated with measurements or observations, that are to do with limitations of the measuring apparatus or the telescope site. So we can distinguish these two things. They\'re built into science and they\'re completely unavoidable. Science is never perfect, and science is never absolutely confident 100 percent of its conclusions. This level of contingency is unavoidable and it\'s not a problem, it just means we move towards greater certainty and we must always pay attention to the errors. Astronomy is in a particular situation within the fields of science, because astronomy does not work as a laboratory with direct control of the experiment. Experiments astronomy take place trillions of miles away at the minimum, that\'s one light year. So astronomy is based on remote situations and remote sensing of those situations. As a result, the uncertainties in astronomy or perhaps larger than in other scientific fields or laboratories involved. In some situations in astronomy, we are quite unsure especially in a new regime. We talk about an order of magnitude uncertainty, which means a factor of 10. The answer could be 10 times smaller or 10 times larger than our first guess. This seems almost like we don\'t know anything at all, but in a new regime and in a universe that spans dozens of orders of magnitude of scale sometimes this is where we start. As astronomers refine their measurements, in many cases they\'re quite happy with a factor of two or 50% uncertainty. For an observation such as the number of stars in a galaxy or the size of a star, this is a reasonable estimate it can tell us quite a lot. It\'s hard to do much better. In many fields of astronomy something with 10 percent precision or accuracy is is about as good as we can get. Remember, we\'re dealing with limited amounts of information from objects that are very faint or very far away, and so 10% or 5% percent accuracy such as for the expansion rate of the universe involves an enormous amount of work even to reach this level. These are the realms of accuracy in astronomy, and we are gradually moving towards precision. There are some measurements in astrophysics where the accuracy is a percent or two, the edge of the earth for example is known with a precision of less than one percent. We can talk in general about three different forms of uncertainty or limitations that occur in science, in all fields of science not just astronomy. The most important and perhaps the trickiest to diagnose is the conceptual limitation of science, for example, we might make a false premise about a theory or an observation. We might confuse causation with correlation, something we\'ll talk about more, or are powerful pattern recognition apparatus might lead us to infer a pattern where none actually exists. Remember, we\'re conditioned to do this, if we were hunter-gatherers and we thought we saw a pattern of a leopard hiding in the underbrush and we were wrong, then we just got a fright. If we didn\'t see the leopard when the leopard was there we were lunch. So we\'re built to recognize patterns very powerfully, and sometimes in science this can lead us astray.\r\n\r\nThe second level of limitations in science are macroscopic, associated with our observations or measurement apparatus. There is no perfect set of data and science, simply doesn\'t exist. Every measurement has limitations. Every dataset is finite, and so there was uncertainty associated with those limitations. We can do our best to improve the observations, to improve the instrument, the apparatus, make a bigger telescope or more accurate detector, but we can never completely overcome those limitations. The third level of limitations in science are microscopic, and these are profound because they\'re associated with the quantum uncertainty in the microscopic world. About a 100 years ago, innovations in physics led to an awareness that there was a fundamental imprecision with which we can measure the physical world of sub-atomic particles. This limitation has nothing to do with our measuring apparatus. No amount of ingenuity or money can overcome this limitation. It\'s built into the quantum nature of reality, and so it forms a profound limitation on our knowledge of the microscopic world. But when we\'re dealing with large macroscopic objects of humans and objects that contain trillions and trillions of atoms, these uncertainties become insignificant. The quantum uncertainty in particular is a very strange beast, and physicists continue to debate a 100 years after these theories were invented what their philosophical implication is. Einstein for example, was extremely uncomfortable with these limitations in nature these absolute obstacles to our understanding, and he thought it was just a matter of ingenuity before we develop a deeper theory that could explain everything. At the moment, we think Einstein was wrong on this matter, and there is no perfect theory of nature at the subatomic level. It upset Einstein very much all that damned quantum jumping. It spoiled his idea of God which I tell you frankly is the only idea of Einstein\'s I never understood. He believed in the same God as Newton, causality nothing without a reason but now one thing led to another until causality was dead. Quantum mechanics made everything finally random. As it could be this way or that way the mathematics deny certainty, they reveal only probability and chance and Einstein couldn\'t believe in a God who threw dice.\r\n\r\nHe should have come to me, I would have told him. Listen Albert, he is for you. Look around, he never stops. Some principles in science are so foundational that we rarely think about them or question them,even working scientists are rarely questioning these ideas. One of the most important for astronomy is causality, the idea that effects have causes, that nothing happens for no reason. This sounds simple but it\'s very important. We have to operate as if causality applies. If causality doesn\'t apply, then effects could happen before their causes which clearly makes no logical sense. But this is a foundational principle because in every situation in astrophysics that we\'ve encountered, when we observe a phenomenon, we imagine that there is a cause of that phenomenon, that nothing occurs without a reason. So far that\'s been validated. Determinism is the idea in philosophy for this concept and it applies in everyday life too. Let me tell you a story. Imagine you get up in the morning and your car doesn\'t start. You check your car, there\'s nothing wrong, the key isn\'t broken, there\'s no wires under the dash that are disconnected, the lights haven\'t been left on all night, the battery seems fine but your car just won\'t start. It\'s frustrating, but you\'ve get your friend out of bed your roommate. He knows about cars more than you do so you get him to look at the car. He does things that you can\'t do. He goes under the hood, checks more wiring, looks at your key, looks at the ignition. After working for an hour, gets exasperated and says, \"I can\'t see anything wrong, your car just won\'t start.\" You\'re not very happy with this explanation so you call the dealer and because your car is still under warranty, they show up in an hour with a fancy van and a lot of high-tech equipment. The dealer wearing his fancy uniform with a logo spends at least an hour on your car. He\'s testing this and he\'s testing that. At the end of his time with his hands dirty and some frustration on his face too he says, \"I\'m sorry I have tested everything. I can\'t find anything wrong. Your car just won\'t start.\" What I\'m asking you is to imagine you\'re in this situation, how would you react to this information? I think you, like most people, like me, would say that\'s unacceptable. That\'s wrong. There\'s obviously something wrong with your car and this person is just not smart enough to find it. It\'s unacceptable for us to think that situations arise for no cause or for no reason. So we all in fact operate as determinists in our everyday life. Science uses as a foundational principle. In the realm of philosophy however, determinism has a dark side. Determinism means that every effect has a cause. The logic of this means that things are predictable because an a cause has an effect and so on. Newtonian gravity and the mechanics of everyday objects that Newton developed into mathematical theories were presumed to be able to predict the behavior of everything in the universe. So mechanical or mathematical determinism is an idea that came about in the 17th century, the idea that we live in a clockwork universe where if we could calculate the theory of gravity or the theories of atoms accurately enough, we could predict with perfect precision the behaviors of those atoms or of the universe as a whole. Now, we\'ve never shown any sign that we can do this but at the time philosophers rebelled strongly against Newton\'s theories. They consider that this might rob us of freewill because if the universe is completely deterministic, everything is preordained and there is no free choice and there is no freewill. This profound philosophical debate has not entirely disappeared but it dissipated of course when we realized that the quantum world has uncertainty built in on the ground floor. For a more routine everyday example of this, let\'s look at the distinction between causation and correlation. We think that things happen for a reason, and it\'s the job of science to find out that reason and make a physical explanation\r\n', 0, NULL, NULL, 0),
(22, 4, 6, 'Sixth Session: Causation and Correlation \r\n\r\nSo I\'ve talked about the formal aspects of correlation, how we measure observations, and look for relationships between parameters or variables. But what about the underlying issue that we\'re trying to explain? This is the confusion between causation and correlation, a profound issue in science that has led to famous mistakes in history. Correlation does not imply causation—i.e., cause and effect explained by a physical theory.\r\n\r\nFor example, consider the relationship between average temperature and the number of pirates. Higher temperatures correlate with more pirates, but does heat create pirates, or are there just more pirate activities in warmer regions? This correlation tells us nothing about the underlying relationship.\r\n\r\nBertrand Russell shared a story about a chicken on a farm. Every morning, the sun rises, and the farmer scatters seed, leading the chicken to correlate the sunrise with being fed. However, one morning, the farmer kills the chicken, demonstrating a catastrophic failure of logic from confusing correlation with causation.\r\n\r\nAnother example comes from Margaret Mead\'s observations in the 1930s. She found South Pacific Islanders putting head lice into their children\'s hair, which seemed strange until she realized that children with fevers don’t have head lice. The Islanders believed that lice could ward off fever, reflecting confusion between correlation and causation.\r\n\r\nProbability and chance play a role in science and observation. A coin toss always has a 50 percent chance, regardless of past outcomes. Misunderstanding probabilities leads to fallacies, such as thinking a six is more likely after several rolls without one.\r\n\r\nIn summary, scientists often gather extensive data to refine their inferences, operating on the principle that effects have causes. However, distinguishing between causation and correlation is a challenging but essential task in scientific inquiry\r\n', 0, NULL, NULL, 0),
(23, 4, 7, 'Seventh Session: Evidence\r\n\r\nEvidence is at the heart of science. When we discuss what distinguishes science from other ways of knowing, we focus on evidence-based reasoning. This means we draw inferences and conclusions about the world based on evidence. But what do we mean by evidence? To a scientist, evidence is based on data derived from labs or telescopes, framed quantitatively, and described numerically. It must also be reproducible—if only one person can obtain it, it\'s not considered evidence. Additionally, evidence is not subjective; while interpretations may vary, the data itself remains objective.\r\n\r\nHowever, evidence is never perfect due to limitations in the number and quality of observations. This does not prevent reliable conclusions from being drawn; there is no science without evidence. Assertions about the natural world require evidence to support them; otherwise, they are merely opinions. Science is a communal activity, requiring scientists to share data openly. This sharing is increasingly vital in modern science, where large amounts of data can be inaccessible, hindering consensus on important issues.\r\n\r\nScientific progress can be divided into three tiers:\r\n\r\nGathering More Data: For instance, observing a faint galaxy requires a limited number of photons within a reasonable time frame, prompting scientists to seek more observation time or larger telescopes.\r\n\r\nRepeating Experiments: To confirm findings, scientists may use different telescopes or detectors to ensure results are consistent.\r\n\r\nCorroboration by Other Scientists: Ultimately, scientific progress relies on experiments being repeated by others using different equipment.\r\n\r\nA historical example illustrates the limitations of data: early drawings of Saturn by different observers, each using telescopes of varying quality, produced differing images. Only through advancements in observation, like the Cassini spacecraft, could we obtain accurate details of Saturn and its rings.\r\n\r\nMurray Gell-Mann, a Nobel Prize-winning physicist, once said, \"Research is what I do when I don\'t know what I\'m doing.\" This captures the essence of science, existing at the boundary between known and unknown, where uncertainty is high. If scientists only focused on measuring things they already understood, no new knowledge would be gained.\r\n\r\nAnother example from astronomy shows the uncertainty in measuring a star\'s position multiple times, leading to a scatter plot representing measurement errors. The mean position provides the best estimate, and this understanding of uncertainty is central to scientific inquiry. The Gaussian distribution, known as the bell curve, often describes this uncertainty.\r\n\r\nIn astronomy, evidence can be categorized into three regimes of physical evidence. We have only directly inspected the Moon and a few other bodies, while most of our information about the universe is indirect, derived from electromagnetic radiation. Science relies heavily on evidence, especially in astronomy, where observations made with telescopes drive progress. Assertions in science must always be backed by evidence, which needs to be reproducible and validated by others. Thus, science is a data-hungry enterprise that constantly seeks better and more extensive evidence\r\n', 0, NULL, NULL, 0),
(24, 4, 8, 'Eight Session: Scientific Method\r\n\r\nThe scientific method is a systematic approach to understanding the natural world, characterized by evidence-based reasoning, observation, and the testing of hypotheses. While simplified flowcharts often depict it as a linear process involving observation, hypothesis formation, experimentation, and conclusion, real science is messier and more complex, often involving iterative cycles of adjustment and debate among scientists.\r\n\r\nKey elements of the scientific method include:\r\n\r\nObservation: Scientists start by observing phenomena in nature and identifying patterns in the data.\r\nHypothesis: Based on these observations, they formulate a hypothesis—a testable explanation for the phenomena.\r\nPrediction: Predictions are made based on the hypothesis, which are then tested through further observations and experiments.\r\nTesting: If the results confirm the hypothesis, it gains support; if not, scientists may adjust or reject it.\r\nTheory Formation: Over time, hypotheses that are repeatedly supported by data can evolve into theories or laws of nature.\r\nHistorically, the development of scientific societies in the 17th century, such as the Royal Society, marked a significant milestone in science, emphasizing collaboration, peer review, and public dissemination of findings. This communal aspect helps to ensure that scientific knowledge is accessible and scrutinized by the broader community, rather than being a closed-off elite endeavor.\r\n\r\nKey Principles:\r\n\r\nNatural Causes: Science seeks natural explanations for phenomena, steering clear of supernatural or arbitrary causes.\r\nOccam\'s Razor: This principle suggests that the simplest explanation that fits the data is often the most likely to be correct.\r\nFalsificationism: The idea that scientific theories can be disproven but never fully verified, highlighting the evolving nature of scientific understanding.\r\nRole of Luck and Creativity: Scientific discovery often involves an element of luck or serendipity, where unexpected observations lead to significant breakthroughs. Additionally, creativity and imagination are vital in formulating new theories and approaches.\r\n\r\nThe Nature of Scientific Theories: Theories should be ambitious yet grounded in observable phenomena. Scientists continuously test and refine these theories, knowing that new data can challenge established ideas.\r\n\r\nDemarcation from Pseudoscience: Understanding the scientific method helps distinguish legitimate scientific inquiry from pseudoscience, which may appear credible but lacks empirical support or methodological rigor. Popular beliefs, such as UFOs or crop circles, often exemplify this distinction, as they rely on anecdotal evidence rather than the rigorous scrutiny characteristic of true scientific practice.\r\n\r\nUltimately, a solid grasp of the scientific method empowers individuals to navigate the complex landscape of information in modern society, fostering critical thinking and rational decision-making in addressing real-world challenges\r\n', 0, NULL, NULL, 0),
(25, 4, 9, 'Ninth Session: Information\r\n\r\nIn today’s world, we’re surrounded by information at every turn, but how do we relate that to knowledge and understanding? Let’s start with a simple example—imagine placing a dot on a piece of paper. How could we describe its location with increasing accuracy? At first, you could say, “The dot is on the paper,” but that tells us almost nothing. If you fold the paper in half and say the dot is either above or below the fold, you’ve given a bit more information. Now, if you fold the paper again in the other direction, you’ve divided it into quarters, and the dot is in one of them, localizing it even more.\r\n\r\nEach time we fold the paper, we ask a simple yes-or-no question: “Is the dot on this side or that side?” Each question provides one bit of information. In computer terms, a bit is just a binary choice—yes or no, one or zero. As we continue folding and asking questions, we narrow down the location of the dot with increasing precision, using just these simple bits of information.\r\n\r\nThis idea extends beyond paper and dots—it applies to many things. If we think about temperature, for example, a basic thermometer might only tell us if it’s hot or cold. That’s one bit of information. A more advanced thermometer could divide temperatures into four ranges, giving us two bits of information, and a precise thermometer could measure down to 100 different degrees. The more bits of information we have, the more detail we gain about the world around us.\r\n\r\nNow let’s consider something else: If I asked you to think of a number between 1 and 1,000, and told you I could guess it in just eight tries, you might doubt it. But if I ask smart questions, like “Is the number above 500?” each yes-or-no answer cuts the number of possibilities in half. By the time I’ve asked eight questions, I’ve narrowed it down to your number. This process shows the power of information and how efficiently it can be used.\r\n\r\nThis concept extends to the digital world, where everything—every video, song, or image—is broken down into bits of information. When you watch a video online, you’re really watching billions of ones and zeros being processed and delivered to you in seconds. The amount of data we deal with today is staggering, growing at an exponential rate—this is what we call Moore’s Law. Not only does it apply to computer speeds, but also to the bandwidth of the internet and the sheer volume of information we now have at our fingertips.\r\n\r\nJust consider that last year alone, humanity created around 50 exabytes of new information. To put that in perspective, that’s a one followed by 20 zeros worth of bytes. As the amount of data grows, so does our need to understand and handle it. With just a few bits, we can represent vast amounts of information. For example, 10 bits can describe 1,000 items, 20 bits can describe a million, and 30 bits can characterize a billion items.\r\n\r\nBut this isn’t just about computers and technology. James Watson, the co-discoverer of DNA’s structure, once said that “life is digital information.” He was referring to the way DNA encodes the information necessary for life, showing that even in biology, information is fundamental. The human genome, for instance, contains about three billion base pairs, encoding everything about who we are.\r\n\r\nLooking back at history, we see that the ways we collect, store, and transmit information have evolved dramatically. For most of Earth’s history, information grew slowly through biological evolution. Then, with the invention of writing and later the printing press, humanity’s ability to store and share knowledge skyrocketed. And now, in the age of computers, information is growing faster than ever before, allowing us to accomplish things that were unimaginable just decades ago.\r\n\r\nBut beyond the bits and bytes, what sets us apart is our imagination. While we can use information to describe the things we observe in the universe, our minds can also dream up things that don’t exist. This power of imagination fuels art, literature, and scientific innovation. And while we might not be able to conceive of everything that happens in the universe, our ability to imagine possibilities beyond our current knowledge allows us to push the boundaries of science.\r\n\r\nIn the end, information is the key to understanding the world around us, but it’s our imagination that enables us to explore and learn about what might lie beyond the known. Through the lens of science, every observation is a question waiting to be answered, and each answer brings us one step closer to deeper knowledge\r\n', 0, NULL, NULL, 0);
INSERT INTO `sessions` (`id`, `level_id`, `session_number`, `content`, `is_completed`, `user_id`, `completed_at`, `coins_awarded`) VALUES
(26, 4, 9, 'Ninth Session: Information\r\n\r\nIn today’s world, we’re surrounded by information at every turn, but how do we relate that to knowledge and understanding? Let’s start with a simple example—imagine placing a dot on a piece of paper. How could we describe its location with increasing accuracy? At first, you could say, “The dot is on the paper,” but that tells us almost nothing. If you fold the paper in half and say the dot is either above or below the fold, you’ve given a bit more information. Now, if you fold the paper again in the other direction, you’ve divided it into quarters, and the dot is in one of them, localizing it even more.\r\n\r\nEach time we fold the paper, we ask a simple yes-or-no question: “Is the dot on this side or that side?” Each question provides one bit of information. In computer terms, a bit is just a binary choice—yes or no, one or zero. As we continue folding and asking questions, we narrow down the location of the dot with increasing precision, using just these simple bits of information.\r\n\r\nThis idea extends beyond paper and dots—it applies to many things. If we think about temperature, for example, a basic thermometer might only tell us if it’s hot or cold. That’s one bit of information. A more advanced thermometer could divide temperatures into four ranges, giving us two bits of information, and a precise thermometer could measure down to 100 different degrees. The more bits of information we have, the more detail we gain about the world around us.\r\n\r\nNow let’s consider something else: If I asked you to think of a number between 1 and 1,000, and told you I could guess it in just eight tries, you might doubt it. But if I ask smart questions, like “Is the number above 500?” each yes-or-no answer cuts the number of possibilities in half. By the time I’ve asked eight questions, I’ve narrowed it down to your number. This process shows the power of information and how efficiently it can be used.\r\n\r\nThis concept extends to the digital world, where everything—every video, song, or image—is broken down into bits of information. When you watch a video online, you’re really watching billions of ones and zeros being processed and delivered to you in seconds. The amount of data we deal with today is staggering, growing at an exponential rate—this is what we call Moore’s Law. Not only does it apply to computer speeds, but also to the bandwidth of the internet and the sheer volume of information we now have at our fingertips.\r\n\r\nJust consider that last year alone, humanity created around 50 exabytes of new information. To put that in perspective, that’s a one followed by 20 zeros worth of bytes. As the amount of data grows, so does our need to understand and handle it. With just a few bits, we can represent vast amounts of information. For example, 10 bits can describe 1,000 items, 20 bits can describe a million, and 30 bits can characterize a billion items.\r\n\r\nBut this isn’t just about computers and technology. James Watson, the co-discoverer of DNA’s structure, once said that “life is digital information.” He was referring to the way DNA encodes the information necessary for life, showing that even in biology, information is fundamental. The human genome, for instance, contains about three billion base pairs, encoding everything about who we are.\r\n\r\nLooking back at history, we see that the ways we collect, store, and transmit information have evolved dramatically. For most of Earth’s history, information grew slowly through biological evolution. Then, with the invention of writing and later the printing press, humanity’s ability to store and share knowledge skyrocketed. And now, in the age of computers, information is growing faster than ever before, allowing us to accomplish things that were unimaginable just decades ago.\r\n\r\nBut beyond the bits and bytes, what sets us apart is our imagination. While we can use information to describe the things we observe in the universe, our minds can also dream up things that don’t exist. This power of imagination fuels art, literature, and scientific innovation. And while we might not be able to conceive of everything that happens in the universe, our ability to imagine possibilities beyond our current knowledge allows us to push the boundaries of science.\r\n\r\nIn the end, information is the key to understanding the world around us, but it’s our imagination that enables us to explore and learn about what might lie beyond the known. Through the lens of science, every observation is a question waiting to be answered, and each answer brings us one step closer to deeper knowledge\r\n', 0, NULL, NULL, 0),
(27, 5, 1, 'First Session: Ancient Astronomy\r\n\r\nAstronomy has always played a pivotal role in human life, both in ancient and modern contexts. For ancient cultures, especially hunter-gatherers like those who may have lived on the African savannah 40,000 to 50,000 years ago, the sky was not just a curiosity; it was essential for survival. They would have used the stars to navigate, ensuring they could return to their camps after hunting or foraging. The lunar cycle provided a natural calendar to track the seasons, helping them plan migrations, track the timing of pregnancies, or prepare for seasonal changes in the environment. Watching the sky was an innate part of their existence, offering practical information about time, weather, and even mythological stories that helped make sense of their world.\r\n\r\nThe night sky was much more than a scientific phenomenon to ancient people. Without modern tools, they were keen observers of celestial events like eclipses, lunar phases, and planetary movements, interpreting these events within cultural and spiritual frameworks. Astronomy shaped many cultural stories and legends, often linking the heavens to gods and divine powers.\r\n\r\nArtifacts like lunar calendars, some dating back over 50,000 years, show that early humans were tracking the moon’s phases to keep time. These lunar marks, found on ancient bones or cave paintings, are strong evidence that ancient cultures had an intimate knowledge of the night sky. The stars, planets, and the sun’s movement became their guideposts for navigation, especially at night or during long-distance travel by sea and land.\r\n\r\nIn ancient civilizations like those of the Egyptians, Mayans, Chinese, and Greeks, astronomy was institutionalized. Stone monuments like Stonehenge, the pyramids at Chichen Itza, and ancient Chinese observatories suggest that ancient peoples not only observed the sky but built monumental structures to track celestial events with remarkable precision. For example, the Mayans used Venus to align their calendar, and Stonehenge was constructed to mark solar events, like the summer solstice, with stunning accuracy.\r\n\r\nIn Polynesia, celestial navigation was so sophisticated that navigators could cross thousands of miles of ocean using only the stars, teaching children star patterns even before they could walk. Similarly, ancient Chinese astronomers kept meticulous records of celestial events over millennia, documenting eclipses, comets, and supernovae.\r\n\r\nThe Antikythera mechanism, a two-millennia-old artifact found in the Mediterranean, reveals that ancient Greeks had a surprisingly advanced understanding of planetary motions and even constructed analog computers to predict eclipses and planetary positions. This shows how astronomy was not just observational but integrated with early engineering and science.\r\n\r\nIn essence, astronomy has always been the foundation of humanity’s understanding of time, space, and existence. Ancient peoples, without modern technology, relied on the sky for daily survival, cultural meaning, and scientific inquiry, weaving it into every aspect of life—from practical navigation and farming to deep philosophical and spiritual questions. It remains a powerful legacy that shaped the evolution of human thought\r\n', 0, NULL, NULL, 0),
(28, 4, 2, 'Second Session: Lunar Cultural Connections\r\n\r\nCalendars are a fascinating intersection where ancient astronomy meets the modern world. They’re something we use every day, yet most of us don’t realize how deeply rooted in history and culture they are. Let’s think about this: there are four major divisions of time—days, months, years, and weeks. Three of these are purely astronomical. The day comes from the Earth’s rotation, the year from its orbit around the Sun, and the month from the lunar cycle. The odd one out is the week, which isn’t tied to any natural phenomena, yet it\'s been used by cultures all over the world for thousands of years.\r\n\r\nInterestingly, weeks have varied in length across different cultures, from four days to ten, but the seven-day week we use today originates from the Babylonians and Egyptians. What’s really cool is how the names of the days of the week in Romance languages (like French and Spanish) are based on the seven classical planets—the Sun, Moon, Mercury, Venus, Mars, Jupiter, and Saturn. These names are less obvious in English and other Northern European languages, where we see a mix of Roman and Norse influences, giving us names like Tuesday (from Tiw) and Thursday (from Thor).\r\n\r\nNow, let’s talk about our calendar year. It has an ancient, slightly chaotic origin. It traces back to early Roman times when the year started in what we now call March, and they only counted 10 months. This is why the names of the last four months—September, October, November, and December—are based on the Latin words for seven, eight, nine, and ten, even though they’re now our ninth through twelfth months. It wasn’t until later, when the Romans adopted a 12-month lunar calendar, that things began to resemble our modern system.\r\n\r\nThe switch to a solar calendar happened because the lunar calendar was 11 days shorter than the solar year, which threw off agriculture. This change was solidified by Julius Caesar, who introduced the Julian calendar with a leap year every four years to account for the extra quarter of a day in each solar year. Of course, Caesar named a month after himself—July—and then Augustus followed suit with August, even tweaking the number of days to make sure his month wasn’t shorter than Caesar’s.\r\n\r\nDespite these changes, the Julian calendar wasn’t perfect. Over centuries, it began to drift out of sync with the solar year. By medieval times, the calendar was off by a week, leading to the Gregorian calendar reform by Pope Gregory, which is what we still use today. This reform included skipping leap years in certain centuries to keep things in line with the actual length of the solar year.\r\n\r\nIt’s interesting that Protestant countries like England resisted adopting the Gregorian calendar because they didn’t want to follow the Pope. They didn’t make the change until the gap between the Julian and Gregorian calendars had grown to 13 days, leading to a sudden jump forward in the date.\r\n\r\nThroughout history, different societies have experimented with more rational calendars. During the French Revolution, there was even an attempt to introduce decimal time, with days divided into 100 hours and so on. It didn’t last, but it shows how deeply timekeeping is connected to both culture and astronomy. Today, most of the world follows a solar calendar, but some cultures, like the Islamic world, still follow a lunar calendar.\r\n\r\nIn the end, our modern calendar is a blend of astronomical observations, cultural influences, and historical quirks that have accumulated over thousands of years. It’s a reminder of how deeply embedded ancient astronomy is in our daily lives\r\n', 0, NULL, NULL, 0),
(29, 4, 3, 'Third Session: Greek Science\r\n\r\nWhen you look at the flags of countries around the world, you may notice that several nations display a crescent moon. Even if you aren\'t familiar with the specific countries, you can identify them as Islamic nations. These Islamic countries follow the lunar calendar, just as their ancestors have done for centuries. This distinction perhaps symbolizes a broader cultural divide between the East and the West. While much of the Western world relies on the solar calendar, Islamic cultures keep time according to the moon. In places like Egypt, for example, the seasonal changes aren\'t as pronounced as in more temperate regions, so timekeeping was based on the flooding of the Nile rather than changes in temperature.\r\n\r\nThe crescent moon on these flags is a powerful symbol in Islamic tradition, marking the beginning of important religious festivals such as Ramadan. In fact, the start of Ramadan is determined by the physical sighting of the crescent moon by a respected figure in the community. If the moon isn\'t visible due to weather conditions, which are rare in that part of the world, the festival could technically be delayed. However, clear skies usually prevail, and the festival is celebrated as planned. Since the Islamic calendar shifts by approximately 11 days each year, it cycles through the entire solar calendar every 33 years, making it difficult to predict Islamic holidays by Western standards.\r\n\r\nThis contrast between lunar and solar calendars has played out over millennia, raising fundamental questions about how humans have measured time. Why do we start our year on January 1st, for instance? There’s no natural reason to begin counting then, but the answer likely stems from ancient sun-worshipping practices. Early Christian cultures, particularly in Rome, adopted pagan festivals, which were based on the solstices and equinoxes. The subtle changes in the sun\'s position during the solstice are difficult to observe precisely, so the year may have been set to begin a few days after the winter solstice to honor those pagan roots.\r\n\r\nWhen we look more closely at how time is divided, we find even deeper historical roots. The 24-hour day—12 hours for the night and 12 for the day—originates with ancient Egyptian astronomers, who divided the night sky into sections based on the appearance of specific stars. The more precise divisions of minutes and seconds, however, trace back to the Babylonians, who used a base-60 counting system. This system, based on the number 60, may have been influenced by the 360-degree movement of the Earth around the sun.\r\n\r\nThe concept of \"clockwise\" movement also has its origins in ancient sun worship. In the northern hemisphere, the sun appears to move in a clockwise direction across the sky, and this motion influenced the design of early mechanical clocks. Interestingly, if civilizations in the southern hemisphere had dominated history, our clocks might move in the opposite direction. Despite the Christianization of much of Europe, remnants of the pagan calendar persist, such as in the celebration of May Day or Halloween, which originated from pagan festivals.\r\n\r\nThe lunar calendar is humanity’s oldest way of tracking time. Evidence of lunar cycles in early human artifacts shows that even ancient peoples recognized the importance of the moon. Yet, as cultures evolved, particularly in the West, the lunar calendar was gradually replaced by the solar one. But in Islamic countries, the crescent moon on their flags reminds us that the lunar calendar still holds a central place in their lives.\r\n\r\nScience, as we understand it today, has its roots in the ancient Greek world, a small but extraordinary civilization that thrived in the Aegean region around 2,500 years ago. The Greeks were not experimental scientists in the modern sense, but their philosophical inquiries laid the foundation for our understanding of the universe. Thinkers like Epicurus speculated about the existence of other worlds and life forms, ideas that align with modern astrobiology. In contrast, Aristotle believed that the Earth was unique and central to the cosmos, an idea that dominated Western thought for centuries.\r\n\r\nGreek philosophers sought to explain the natural world using logic and abstract reasoning. They developed mental models of nature, unlike previous civilizations that merely observed the stars and recorded patterns without theorizing about them. This method of thinking allowed them to make significant advances in fields such as mathematics and astronomy. The Greeks knew, for instance, that the Earth was round, and they even calculated its size with remarkable accuracy based on their observations of lunar eclipses.\r\n\r\nPythagoras, one of the most influential thinkers of ancient Greece, gave us the Pythagorean theorem, abstracting a general principle from the Egyptians\' practical use of triangles in surveying the Nile Delta. His ideas about mathematics and the universe were revolutionary for their time and still resonate today.\r\n\r\nAnother example of Greek innovation comes from their understanding of the cosmos. While Aristotle believed in a geocentric universe, where the Earth was the center of all things, other Greek thinkers proposed a heliocentric model long before Copernicus. The retrograde motion of planets like Mars, which puzzled ancient astronomers, would later be explained by this heliocentric theory, but in Aristotle’s time, the geocentric model prevailed.\r\n\r\nAs we reflect on the scientific achievements of the Greeks, it\'s clear that they laid the groundwork for many of the ideas we take for granted today. Their willingness to create mental models, their use of mathematics to describe the natural world, and their philosophical inquiries into the nature of the universe all played a crucial role in shaping the scientific method as we know it\r\n', 0, NULL, NULL, 0),
(30, 4, 4, 'Fourth Session: Copernican Revolution\r\n\r\nFive hundred years ago, a mid-level Catholic cleric in Poland turned the world upside down. His name was Nicholas Copernicus, and he proposed the heliocentric model, which suggested that the Earth was not the center of the universe, but instead revolved around the sun along with other planets. This idea was groundbreaking, but only occupied a small part of his book De Revolutionibus, which was largely mathematical. The title, meaning \"On the Revolutions,\" contributed to our modern understanding of \"revolution\" as a symbol of societal upheaval. Copernicus inherited the flawed ideas of Ptolemy, whose geocentric model was clumsy and failed to explain the retrograde motion of planets like Mars. By placing the sun at the center, these complications vanished.\r\n\r\nAs a Catholic cleric, Copernicus was defying church doctrine, which held that the Earth stood still based on biblical interpretations. This put him at significant personal risk, and it\'s likely why he delayed publishing his work for 20 years, only allowing it to be printed after his death. His friend Rheticus tried to soften the blow by framing it as a mathematical model, but the implications were revolutionary. When the book reached other thinkers across Europe, aided by the printing press, the heliocentric model began to take hold.\r\n\r\nHowever, this model wasn\'t without its own challenges. The stars didn’t change in brightness or relative positions throughout the year, which should happen if Earth were moving around the sun. The only explanation was that the stars were far more distant than previously thought, implying a vast universe, much larger than the Greeks or the church could accept.\r\n\r\nThe real revolution of Copernicus\' work wasn\'t just in astronomy, but in the way it displaced humans from the center of creation. The Geo-Christian belief held that humans were the pinnacle of creation, and the universe was built around us. Copernicus\' theory shattered this comforting worldview, suggesting that Earth was just another planet in space. This cultural dislocation was perhaps the most dangerous aspect of his work, undermining centuries of religious doctrine.\r\n\r\nThe debate over the distance to the stars became a battleground between the geocentric and heliocentric models. The Greeks had entertained the idea of a three-dimensional universe, but no parallax shift—the slight displacement of nearby stars relative to distant ones—had been observed, reinforcing the idea that the universe was far larger than imagined. This uncomfortable truth was hard to swallow for many at the time.\r\n\r\nTycho Brahe, a brilliant Danish astronomer, became the next key figure in this story. Despite coming from poverty, fortune favored him when he and his uncle saved the King of Denmark, earning him vast wealth and an island where he built his observatory. Over 22 years, Brahe gathered the most accurate data on planetary motion without a telescope, using geometric instruments. However, he didn’t believe in the Copernican model and struggled to make sense of his data.\r\n\r\nBrahe eventually took on Johannes Kepler, a brilliant mathematician, as his assistant, though he was reluctant to share his data. After Brahe’s death under dramatic circumstances (he overate at a feast, leading to a fatal infection), Kepler inherited the data and used it to confirm the heliocentric model. This marked a turning point in astronomy and a cultural revolution, breaking the bond between humans and their creator and leading to inevitable conflict with the church\r\n', 0, NULL, NULL, 0),
(31, 4, 5, 'Fifth Session: Kepler\r\n\r\nThe next major figure in the Copernican revolution was Johannes Kepler, a brilliant mathematician, perhaps the best of his time. Despite his reputation across Europe, Kepler’s life was marked by hardship. He suffered from chronic illness, often bedridden and covered in boils. His mother was accused of witchcraft, and Kepler had to spend much of his resources defending her from execution. Even Galileo refused to send him a telescope when Kepler requested one, adding to his series of misfortunes.\r\n\r\nHowever, Kepler’s greatest stroke of fortune came from his work with Tycho Brahe, inheriting Brahe’s incredibly precise dataset on planetary motion. Using this data, Kepler made a groundbreaking discovery: the orbits of the planets were not circular, as had been believed for millennia, but elliptical, with the sun at one focus. This went against two thousand years of thinking, rooted in Greek philosophy, that circles and spheres were the perfect shapes of the universe and thus must govern the movements of celestial objects.\r\n\r\nKepler\'s work reveals how hard it was for him to let go of the idea of circular orbits, but ultimately, the data led him to formulate three laws of planetary motion that remain true today.\r\n\r\nKepler\'s First Law states that planets move in elliptical orbits with the sun at one focus. While these ellipses are subtle (Earth\'s orbit deviates from being a perfect circle by only 4%), the precision of Brahe’s data allowed Kepler to detect this.\r\n\r\nKepler\'s Second Law, also known as the law of equal areas, describes how a planet moves faster when it is closer to the sun and slower when it is farther away. It states that the line connecting a planet to the sun sweeps out equal areas in equal time intervals.\r\n\r\nKepler\'s Third Law establishes a mathematical relationship between a planet’s orbital period and its average distance from the sun. Specifically, the square of a planet’s orbital period is proportional to the cube of its average distance from the sun. This law applies not only to the planets known in Kepler’s time but also to planets discovered after his death.\r\n\r\nAlthough Kepler’s laws did not explain the force responsible for planetary motion—that discovery would come with Newton—his work provided the most convincing evidence yet that the Copernican heliocentric model was correct. His mathematical rigor transformed our understanding of the solar system, laying the foundation for future advancements in physics and astronomy.\r\n', 0, NULL, NULL, 0),
(32, 4, 6, 'Sixth Session: Galileo\r\n\r\nThe next major figure in the history of the Copernican revolution is a titan of science, Galileo Galilei. Born in Pisa, Galileo was the first modern physical scientist, conducting experiments and developing theories—a true all-rounder. He followed the scientific method to a tee, defining physical science for generations to come. As he approached the study of astronomy, he was aware of three key objections to the Copernican model, rooted in Aristotelian physics.\r\n\r\nThe first objection questioned the motion of the Earth; if it’s moving, why can’t we feel it? The second objection revolved around the idea of perfection in circles and spheres—how could anything imperfect exist in the heavens? The third objection pertained to stellar parallax; if the Earth is in motion, why don’t we see stars change their positions?\r\n\r\nIn 1609, Galileo demonstrated an instrument that would soon be known as the telescope. He showed that from tall towers, this device could spot ships hours before their sails were visible to the naked eye. When he aimed his telescope at the night sky, he discovered that the moon was a world with mountains, Jupiter had its own moons, and the Milky Way was a band of countless stars.\r\n\r\nGalileo tackled the first objection by proposing a precursor to the modern idea of inertia: the Earth, as it spins and rotates, carries its atmosphere along with it. For someone standing on the surface, the large motion of rotation is not felt. He conceptualized this through a thought experiment, where someone below deck on a moving ship wouldn’t realize they were in motion. This insight convinced him that the Earth could indeed be moving and carrying its atmosphere with it.\r\n\r\nHe also recognized that an object in motion stays in motion, challenging Aristotelian ideas and foreshadowing one of Newton\'s theories of motion. Galileo conducted many experiments with falling objects, using inclined planes to better observe their motion and timing their fall with his pulse. These observations led him to conclude that light and heavy objects fall at the same rate of acceleration, a principle confirmed during the Apollo missions.\r\n\r\nThe second objection, rooted in the Greek idea of perfection, was dismantled when Galileo observed sunspots, proving the sun was not a flawless sphere. His telescope revealed the geological features of the moon, indicating it was a world like Earth. This observation began the shift towards the \"many worlds\" idea in the cosmos. He discovered the moons of Jupiter, demonstrating that not only did the Earth and other planets orbit the Sun, but there were objects orbiting other planets, further removing the notion of Earth\'s special status in the universe.\r\n\r\nGalileo revolutionized scientific publishing by writing in Italian rather than Latin, making his work accessible to the public, and giving lectures to share his findings.\r\n\r\nThe third objection regarding stellar parallax was one he couldn\'t solve; even he couldn\'t observe it. The parallax of the nearest star wasn\'t detected until 1824. However, with his telescope, he resolved the Milky Way into countless stars, calculating vast differences in distance between the brightest and faintest stars. His observations gave depth to the universe, leading him to believe we lived in a vast three-dimensional cosmos.\r\n\r\nThe clincher for the Copernican model came from Galileo\'s observations of the phases of Venus. In the geocentric model, Venus wouldn\'t exhibit phases, but in the heliocentric model, it would show a full set of phases as it orbited the Sun. This clear prediction of the heliocentric model provided strong evidence for its validity.\r\n\r\nYet, Galileo’s discoveries brought him into conflict with the Catholic Church, which upheld the geocentric model. His assertive promotion of heliocentrism led to his trial by the Inquisition. Despite being warned not to present heliocentrism as absolute truth, he persisted, ultimately leading to his recantation in 1633. He spent his final years under house arrest, continuing his work in a beautiful villa outside Florence.\r\n\r\nThough he faced significant challenges, including conflict with the church and personal struggles, the Copernican system gained traction. By the end of Galileo\'s life, the understanding of Earth as part of a much larger universe had firmly taken root. His observations and insights not only cemented the Copernican revolution but also laid the groundwork for modern astronomy\r\n', 0, NULL, NULL, 0),
(33, 4, 7, 'Seventh Session: Copernican Vindication\r\n\r\nGalileo faced a serious tussle with the Catholic Church, but he provided decisive evidence supporting the Copernican model. By the end of his life, it was widely accepted that Earth was not the center of the universe. This seismic shift led to strong pushback from the Church, highlighting an ongoing tension between science and religion that persists even today.\r\n\r\nTo illustrate this conflict further, let’s discuss Giordano Bruno. Although it may be inappropriate to label him a martyr to science or even a scientist, Bruno held strikingly modern ideas about an infinite universe, the possibility of many worlds, and the existence of intelligent life beyond Earth. His thoughts were less coherent than Galileo’s, yet they were groundbreaking. Bruno was prosecuted by the Inquisition for heresy, with the charge sheet branding him an “impenitent and proteinaceous heretic.” In 1600, he was executed in the Campo de\' Fiori, where a statue now commemorates him.\r\n\r\nWe can visualize the unfortunate and graphic scene of his execution: paraded through the streets in an ox cart, covered in dung and straw to humiliate him, naked while children laughed and played nearby. He was strapped to a stake atop a pyre, and historical records tell of soldiers silencing him in his final moments. One soldier drove a spike through his tongue to prevent him from speaking heresy, while another, in a moment of penitence, hung a bag of gunpowder around his neck to hasten his death. This brutal fate befell Bruno 30 years before Galileo faced the Inquisition.\r\n\r\nOn a slightly more hopeful note regarding the Catholic Church, I have collaborated with and been friends with astronomers at the Vatican Observatory for 30 years. They live and work at the Steward Observatory and in Rome, and they have graciously hosted me. It’s not entirely accurate to say that the Catholic Church opposes astronomy; in fact, many cosmologists and astronomers there are engaged in astrobiology. From my perspective, the science-religion debate doesn’t have to involve conflict.\r\n\r\nThrough the contributions of Galileo, Tycho Brahe, Bruno, Johannes Kepler, and Copernicus before them, we have established the foundation of modern astronomy. Kepler expanded on these ideas, writing Somnium, widely regarded as the first science fiction book, which speculated about life on the moon—albeit in a fanciful and not particularly realistic manner. This laid the groundwork for future considerations of space travel and the exploration of other worlds.\r\n\r\nBy the end of the Copernican Revolution, our understanding of the universe had been transformed. The first step of this ongoing revolution has been the gradual displacement of humans and Earth from their once central positions in the universe. The Copernican Revolution not only sparked cultural and social upheaval but also set the stage for further discoveries.\r\n\r\nAs we delve into the history of astronomy, we’ve come to recognize Earth\'s location within a vast system of stars known as the Milky Way, and, within the last century, we\'ve pinpointed the Milky Way’s place within a much larger universe filled with galaxies. The Copernican Revolution could have two more significant steps ahead: one would be demonstrating that life on Earth is not unique, suggesting we inhabit a biological universe. The other involves a frontier concept in cosmology—the idea that the entirety of observable space and time is not the totality; other universes may exist beyond our perception\r\n', 0, NULL, NULL, 0);

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
(3, 'Mohamed Ehab', 'mohamed@test.com', '25f9e794323b453885f5181f1b624d0b', 0, 'default_avatar.png', 'no.png', 0, '2024-09-30 18:02:01', 1, 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_avatars`
--

CREATE TABLE `user_avatars` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `avatar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_planets`
--

CREATE TABLE `user_planets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `planet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `planets`
--
ALTER TABLE `planets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
