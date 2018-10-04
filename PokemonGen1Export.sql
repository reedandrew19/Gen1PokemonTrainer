CREATE DATABASE  IF NOT EXISTS `Gen1PokemonApp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Gen1PokemonApp`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: gen1pokemonapp.cacuxkbfp0fa.us-east-2.rds.amazonaws.com    Database: Gen1PokemonApp
-- ------------------------------------------------------
-- Server version	5.6.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `EvolveTo`
--

DROP TABLE IF EXISTS `EvolveTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvolveTo` (
  `Pokemon` varchar(45) NOT NULL,
  `PokemonEvolution` varchar(45) NOT NULL,
  `EvolutionLevel` tinyint(11) DEFAULT NULL,
  `OtherEvolutionMethod` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Pokemon`,`PokemonEvolution`),
  KEY `PokemonEvolution_idx` (`PokemonEvolution`),
  CONSTRAINT `Pokemon` FOREIGN KEY (`Pokemon`) REFERENCES `Pokemon` (`Name`) ON UPDATE CASCADE,
  CONSTRAINT `PokemonEvolution` FOREIGN KEY (`PokemonEvolution`) REFERENCES `Pokemon` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains data on a Pokemon''s next Evolution';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EvolveTo`
--

LOCK TABLES `EvolveTo` WRITE;
/*!40000 ALTER TABLE `EvolveTo` DISABLE KEYS */;
INSERT INTO `EvolveTo` VALUES ('Bulbasaur','Ivysaur',16,NULL),('Eevee','Flareon',NULL,'Using a Fire Stone'),('Eevee','Jolteon',NULL,'Using a Thunder Stone'),('Eevee','Vaporeon',NULL,'Using a Water Stone'),('Ivysaur','Venusaur',32,NULL);
/*!40000 ALTER TABLE `EvolveTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Moves`
--

DROP TABLE IF EXISTS `Moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Moves` (
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `PP` tinyint(11) unsigned NOT NULL,
  `BasePower` tinyint(11) unsigned DEFAULT NULL,
  `Accuracy` tinyint(11) unsigned DEFAULT NULL,
  `BattleEffect` varchar(255) NOT NULL,
  `EffectRate` tinyint(11) unsigned DEFAULT NULL,
  `TMNumber` tinyint(11) unsigned DEFAULT NULL,
  `HMNumber` tinyint(11) unsigned DEFAULT NULL,
  `SpeedPriority` tinyint(11) NOT NULL,
  `PokemonHitInBattle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Info about moves pokemon use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Moves`
--

LOCK TABLES `Moves` WRITE;
/*!40000 ALTER TABLE `Moves` DISABLE KEYS */;
INSERT INTO `Moves` VALUES ('Absorb','Grass',20,20,100,'It adds half the HP it drained from the target to the attacker\'s HP.',NULL,NULL,NULL,0,'Enemy'),('Acid','Poison',30,40,100,'Has a 33 percent chance of lowering the target\'s DEFENSE.',33,NULL,NULL,0,'Enemy'),('Acid Armor','Poison',40,0,100,'Melts the user\'s body for protection. A move that sharply raises DEFENSE.',NULL,NULL,NULL,0,'User'),('Agility','Psychic',30,0,100,'A special technique that greatly boosts the user\'s SPEED. Can normally be used up to three times.',NULL,NULL,NULL,0,'User'),('Amnesia','Psychic',20,0,100,'Sharply raises the user\'s SPECIAL stat. Also increases protection against special attacks.',NULL,NULL,NULL,0,'User'),('Aurora Beam','Ice',20,65,100,'Has a 33 percent chance of reducing the target\'s ATTACK power.',33,NULL,NULL,0,'Enemy'),('Barrage','Normal',20,15,85,'Several spheres are thrown consecutively at the target to inflict damage.',NULL,NULL,NULL,0,'Enemy'),('Barrier','Psychic',30,0,100,'Instantly forms a barrier between the user and the opponent. DEFENSE is sharply increased.',NULL,NULL,NULL,0,'User'),('Bide','Normal',10,0,100,'The user waits for several turns. At the end, it returns double the damage it received.',NULL,34,NULL,0,'User'),('Bind','Normal',20,15,75,'Traps and squeezes the target over several turns. The target cannot move while under attack.',NULL,NULL,NULL,0,'Enemy'),('Bite','Normal',25,60,100,'A bite made using sharp fangs. This has a 10 percent chance of causing the opponent to flinch, and it might not attack.',10,NULL,NULL,0,'Enemy'),('Blizzard','Ice',5,120,90,'The strongest ICE-type attack. Has a 10 percent chance of freezing the target solid.',10,14,NULL,0,'Enemy'),('Body Slam','Normal',15,85,100,'Has a 30 percent chance of paralyzing the target if it connects.',30,8,NULL,0,'Enemy'),('Bone Club','Ground',20,65,85,'A physical attack using a bone as a club. If it connects, it has a 10 percent chance of causing the target to flinch.',10,NULL,NULL,0,'Enemy'),('Boonemerang','Ground',10,50,90,'A boomerang made of bone is thrown to inflict damage twice, on the way out and on its return.',NULL,NULL,NULL,0,'Enemy'),('Bubble','Water',30,20,100,'Has a 33 percent chance of reducing the target\'s SPEED.',33,NULL,NULL,0,'Enemy'),('Bubble Beam','Water',20,65,100,'Has a 33 percent chance of reducing the target\'s SPEED.',33,11,NULL,0,'Enemy'),('Clamp','Water',10,35,75,'The target is gripped in the attacker\'s shell for two to five turns. It can\'t move while under attack.',NULL,NULL,NULL,0,'Enemy'),('Comet Punch','Normal',15,18,85,'Although each slap is weak, this attack hits the target two to five times in succession.',NULL,NULL,NULL,0,'Enemy'),('Confuse Ray','Ghost',10,0,100,'A sinister flash of light makes the target confused.',NULL,NULL,NULL,0,'Enemy'),('Confusion','Psychic',25,50,100,'Has a 10 percent chance of leaving the target confused.',10,NULL,NULL,0,'Enemy'),('Constrict','Normal',35,10,100,'Has a 33 percent chance of reducing the target\'s SPEED.',33,NULL,NULL,0,'Enemy'),('Conversion','Normal',30,0,100,'A special move that switches the user\'s elemental type to that of the target.',NULL,NULL,NULL,0,'User'),('Counter','Fighting',20,1,100,'A retaliation move that pays back double the damage of a Normal or Fighting type attack. Highly accurate.',NULL,18,NULL,-1,'Enemy'),('Crabhammer','Water',10,90,85,'A move that is used only by Pokémon with pincers. Likely to get a critical hit.',NULL,NULL,NULL,0,'Enemy'),('Cut','Normal',30,50,95,'Can be used for cutting small bushes to open new paths.',NULL,NULL,1,0,'Enemy'),('Defense Curl','Normal',40,0,100,'Raises the user\'s DEFENSE. Can normally be used up to six times in a row.',NULL,NULL,NULL,0,'User'),('Dig','Ground',10,100,100,'The attacker digs underground in the first turn, then pops up in the next turn to attack.',NULL,28,NULL,0,'Enemy'),('Disable','Normal',20,0,55,'A technique that disables one of the target\'s moves. The disabled move can\'t be used until it wears off.',NULL,NULL,NULL,0,'Enemy'),('Dizzy Punch','Normal',10,70,100,'The punch is relatively strong and highly accurate.',NULL,NULL,NULL,0,'Enemy'),('Double Kick','Fighting',30,30,100,'As the name implies, it is actually two quick kicks in succession.',NULL,NULL,NULL,0,'Enemy'),('Double Slap','Normal',10,15,85,'Although each slap is weak, this attack hits the target two to five times in succession.',NULL,NULL,NULL,0,'Enemy'),('Double Team','Normal',15,0,100,'Creates illusionary copies of the user. The copies disorient the enemy, raising the user\'s evasion.',NULL,32,NULL,0,'User'),('Double-Edge','Normal',15,100,100,'A charging tackle attack. One quarter of the damage it inflicts comes back to hurt the attacker.',NULL,10,NULL,0,'Enemy'),('Dragon Rage','Dragon',10,1,100,'It inflicts 40 HP of damage, regardless of the target\'s type.',NULL,23,NULL,0,'Enemy'),('Dream Eater','Psychic',15,100,100,'Works only on sleeping Pokémon. This technique steals the target\'s HP and adds it to the user\'s HP.',NULL,42,NULL,0,'Enemy'),('Drill Peck','Flying',20,80,100,'It is strong and highly likely to hit the target.',NULL,NULL,NULL,0,'Enemy'),('Earthquake','Ground',10,100,100,'An attack that inflicts damage by shaking the ground.',NULL,26,NULL,0,'Enemy'),('Egg Bomb','Normal',10,100,75,'An egg is launched at the target. It may miss, however.',NULL,37,NULL,0,'Enemy'),('Ember','Fire',25,40,100,'Has a 10 percent chance of leaving the target with a damaging burn.',10,NULL,NULL,0,'Enemy'),('Explosion','Normal',5,170,100,'The most powerful attack of all. However, the attacker faints after using this move.',NULL,47,NULL,0,'Enemy'),('Fire Blast','Fire',5,120,85,'The strongest FIRE-type attack. Has a one-in-three chance of inflicting a burn on the target.',33,38,NULL,0,'Enemy'),('Fire Punch','Fire',15,75,100,'Has a 10 percent chance of inflicting a burn on the target.',10,NULL,NULL,0,'Enemy'),('Fire Spin','Fire',15,15,70,'An attack that lasts two to five turns. The target cannot move while surrounded by flames.',NULL,NULL,NULL,0,'Enemy'),('Fissure','Ground',5,1,30,'Causes a single-hit knockout if it hits.',NULL,27,NULL,0,'Enemy'),('Flamethrower','Fire',15,95,100,'Has a 10 percent chance of leaving the target with a damaging burn.',10,NULL,NULL,0,'Enemy'),('Flash','Normal',20,0,70,'Creates a brilliant flash of light that blinds the target or lights up caves. This technique reduces the opponent\'s accuracy.',NULL,NULL,5,0,'Enemy'),('Fly','Flying',15,70,95,'The Pokémon flies high, then strikes in the next turn. Used for flying to places already visited.',NULL,NULL,2,0,'Enemy'),('Focus Energy','Normal',30,0,100,'Supposed to raise the likelihood of nailing the opponent\'s weak spot for a critical hit, but in the first generation it actually makes it harder to critical because of a glitch. Don\'t use this move.',NULL,NULL,NULL,0,'User'),('Fury Attack','Normal',20,15,85,'The Pokémon rapidly jabs at its opponent several times.',NULL,NULL,NULL,0,'Enemy'),('Fury Swipes','Normal',15,18,80,'The target is scratched by sharp claws two to five times in quick succession.',NULL,NULL,NULL,0,'Enemy'),('Glare','Normal',80,0,75,'The target is transfixed with terrifying sharp eyes. The target is frightened into paralysis.',NULL,NULL,NULL,0,'Enemy'),('Growl','Normal',40,0,100,'A technique that lowers the target\'s ATTACK power. Can normally be used up to six times.',NULL,NULL,NULL,0,'Enemy'),('Growth','Normal',40,0,100,'Raises SPECIAL to make special attacks stronger and enhance protection against special moves.',NULL,NULL,NULL,0,'User'),('Guillotine','Normal',5,1,30,'A single-hit knockout attack. Learned only by Pokémon that have large pincers.',NULL,NULL,NULL,0,'Enemy'),('Gust','Normal',35,40,100,'Used by bird Pokémon. A powerful wind is generated by flapping wings.',NULL,NULL,NULL,0,'Enemy'),('Harden','Normal',30,0,100,'Raises the user\'s DEFENSE. Useful when battling physically strong Pokémon.',NULL,NULL,NULL,0,'User'),('Haze','Ice',30,0,100,'Eliminates all changes affecting status, such as SPEED and accuracy, of both Pokémon in battle.',NULL,NULL,NULL,0,'Field'),('Headbutt','Normal',15,70,100,'Has a 30 percent chance of making the target flinch if it connects.',30,NULL,NULL,0,'Enemy'),('Hi Jump Kick','Fighting',20,85,90,'Stronger than a JUMP KICK. If it misses, the attacker sustains 1 HP of damage.',NULL,NULL,NULL,0,'Enemy'),('Horn Attack','Normal',25,65,100,'A sharp horn is driven hard into the target to inflict damage.',NULL,NULL,NULL,0,'Enemy'),('Horn Drill','Normal',5,1,30,'A single-hit knockout attack. Learned only by Pokémon with a horn or horns.',NULL,7,NULL,0,'Enemy'),('Hydro Pump','Water',5,120,80,'The strongest WATER-type attack. However, while it is powerful, it may miss the target.',NULL,NULL,NULL,0,'Enemy'),('Hyper Beam','Normal',5,150,90,'An extremely powerful attack. The attacker becomes so tired, it has to rest the next turn.',NULL,15,NULL,0,'Enemy'),('Hyper Fang','Normal',15,80,90,'Has a 10 percent chance of making the target flinch.',10,NULL,NULL,0,'Enemy'),('Hypnosis','Psychic',20,0,60,'The target is hypnotized into a deep sleep.',NULL,NULL,NULL,0,'Enemy'),('Ice Beam','Ice',10,95,100,'Has a 10 percent chance of freezing the target solid.',10,13,NULL,0,'Enemy'),('Ice Punch','Ice',15,75,100,'Has a 10 percent chance of freezing the target.',10,NULL,NULL,0,'Enemy'),('Jump Kick','Fighting',25,70,95,'If it misses, the attacker gets hurt by 1 HP.',NULL,NULL,NULL,0,'Enemy'),('Karate Chop','Normal',25,50,100,'Often turns into a critical hit.',NULL,NULL,NULL,0,'Enemy'),('Kinesis','Psychic',15,0,80,'A special move of bending spoons to confound the enemy. Makes the user harder to hit.',NULL,NULL,NULL,0,'Enemy'),('Leech Life','Bug',15,20,100,'An HP-draining attack. It adds half the HP it drained from the target to the attacker\'s HP.',NULL,NULL,NULL,0,'Enemy'),('Leech Seed','Grass',10,0,90,'Plants a seed on the target Pokémon. The seed slowly drains the target\'s HP for the attacker.',NULL,NULL,NULL,0,'Enemy'),('Leer','Normal',30,0,100,'A technique that lowers the target\'s DEFENSE. Useful against tough, armored Pokémon.',NULL,NULL,NULL,0,'Enemy'),('Lick','Ghost',30,20,100,'Has a 30 percent chance of leaving the target with paralysis.',30,NULL,NULL,0,'Enemy'),('Light Screen','Psychic',30,0,100,'Reduces damage from special attacks by about half.',NULL,NULL,NULL,0,'User'),('Lovely Kiss','Normal',10,0,75,'A special move that puts the target to sleep with a big kiss.',NULL,NULL,NULL,0,'Enemy'),('Low Kick','Fighting',20,50,90,'Has a 30 percent chance of making the target flinch if it connects.',30,NULL,NULL,0,'Enemy'),('Meditate','Psychic',40,0,100,'A special technique that boosts the user\'s ATTACK power. Can normally be used up to six times.',NULL,NULL,NULL,0,'User'),('Mega Drain','Grass',10,40,100,'It adds half the HP it drained from the target to the attacker\'s HP.',NULL,21,NULL,0,'Enemy'),('Mega Kick','Normal',5,120,75,'Out of all the Pokémon kicking attacks, this is the strongest.',NULL,5,NULL,0,'Enemy'),('Mega Punch','Normal',20,80,85,'It is highly accurate and relatively powerful.',NULL,1,NULL,0,'Enemy'),('Metronome','Normal',10,0,100,'The user waggles its finger, triggering a move. There is no telling what will happen.',NULL,35,NULL,0,'User'),('Mimic','Normal',10,0,100,'A move for learning one of the opponent\'s moves, for use during that battle only.',NULL,31,NULL,0,'Enemy'),('Minimize','Normal',20,0,100,'Reduces the user\'s size and makes it harder to hit. Can normally be used up to six times.',NULL,NULL,NULL,0,'User'),('Mirror Move','Flying',20,0,100,'A move that strikes back with the opponent\'s last move.',NULL,NULL,NULL,0,'Enemy'),('Mist','Ice',30,0,100,'Provides full protection against any enemy status attack, such as those that lower DEFENSE.',NULL,NULL,NULL,0,'User'),('Night Shade','Ghost',15,0,100,'A GHOST-type attack. Highly accurate, it inflicts damage regardless of the target\'s type. Night Shade inflicts damage equal to the user\'s level.',NULL,NULL,NULL,0,'Enemy'),('Pay Day','Normal',20,40,100,'A move that also nets money at the end of battle. How much depends on the attack frequency and level.',NULL,16,NULL,0,'Enemy'),('Peck','Flying',35,35,100,'It is favored by Pokémon that have beaks and/or horns.',NULL,NULL,NULL,0,'Enemy'),('Petal Dance','Grass',20,70,100,'A dance-like attack that lasts two to three turns. Afterwards, the attacker becomes confused.',NULL,NULL,NULL,0,'Enemy'),('Pin Missile','Bug',20,14,85,'An attack that fires many needle-like projectiles from the body. Strikes several times.',NULL,NULL,NULL,0,'Enemy'),('Poison Gas','Poison',40,0,55,'A poisonous cloud of gas is forcefully expelled to poison the target.',NULL,NULL,NULL,0,'Enemy'),('Poison Powder','Poison',35,0,75,'A technique that poisons the target. If poisoned, the victim loses HP steadily.',NULL,NULL,NULL,0,'Enemy'),('Poison Sting','Poison',35,15,100,'Has a 20 percent chance of leaving the target with the lingering effects of poison.',20,NULL,NULL,0,'Enemy'),('Pound','Normal',35,40,100,'Slightly stronger than TACKLE. Many Pokémon know this move.',NULL,NULL,NULL,0,'Enemy'),('Psybeam','Psychic',20,65,100,'Has a 10 percent chance of making the target confused.',10,NULL,NULL,0,'Enemy'),('Psychic','Psychic',10,90,100,'Has a 33 percent chance of lowering the target\'s SPECIAL rating.',33,29,NULL,0,'Enemy'),('Psywave','Psychic',15,1,80,'An attack of varying intensity. It occasionally inflicts heavy damage.',NULL,46,NULL,0,'Enemy'),('Quick Attack','Normal',30,40,100,'An attack that always strikes first. If both Pokémon use this, the one with higher SPEED attacks first.',NULL,NULL,NULL,1,'Enemy'),('Rage','Normal',20,20,100,'A non-stop attack move. The user\'s ATTACK power increases every time it sustains damage.',NULL,20,NULL,0,'Enemy'),('Razor Leaf','Grass',25,55,95,'An attack that sends sharp-edged leaves at the target. Likely to get a critical hit.',NULL,NULL,NULL,0,'Enemy'),('Razor Wind','Normal',10,80,75,'A two-turn attack with the wind attack in the second turn.',NULL,2,NULL,0,'Enemy'),('Recover','Normal',20,0,100,'Restores HP by 1/2 of the user\'s maximum HP. Few Pokémon learn this technique on their own.',NULL,NULL,NULL,0,'User'),('Reflect','Psychic',20,0,100,'Reduces damage from physical attacks by about half.',NULL,33,NULL,0,'User'),('Rest','Psychic',10,0,100,'The user takes a nap to fully restore its HP and recover from any status abnormalities.',NULL,44,NULL,0,'User'),('Roar','Normal',20,0,100,'A terrifying roar that drives wild Pokémon away. It is useful only in the wild.',NULL,NULL,NULL,0,'Enemy'),('Rock Slide','Rock',10,75,90,'An attack that hits the target with an avalanche of rocks and boulders.',NULL,48,NULL,0,'Enemy'),('Rock Throw','Rock',15,50,65,'As the name implies, a huge boulder is dropped on the target.',NULL,NULL,NULL,0,'Enemy'),('Rolling Kick','Fighting',15,60,85,'Has a 30 percent chance of making the target flinch if it connects.',30,NULL,NULL,0,'Enemy'),('Sand Attack','Normal',15,0,100,'An attack in which sand is used to blind the target and reduce its attack accuracy.',NULL,NULL,NULL,0,'Enemy'),('Scratch','Normal',35,40,100,'Sharp claws are used to inflict damage on the target.',NULL,NULL,NULL,0,'Enemy'),('Screech','Normal',40,0,85,'A move that makes a horrible noise. It sharply reduces the target\'s DEFENSE.',NULL,NULL,NULL,0,'Enemy'),('Seismic Toss','Fighting',20,1,100,'Throws the target with enough force to flip the world upside down. Seismic Toss inflicts damage equal to the user\'s level.',NULL,19,NULL,0,'Enemy'),('Self-Destruct','Normal',5,130,100,'The user explodes, inflicting damage on the enemy, then faints.',NULL,36,NULL,0,'Enemy'),('Sharpen','Normal',30,0,100,'Raises the user\'s ATTACK power. The edges of the Pokémon are made harder for more impact.',NULL,NULL,NULL,0,'User'),('Sing','Normal',15,0,55,'A soothing melody lulls the target to sleep.',NULL,NULL,NULL,0,'Enemy'),('Skull Bash','Normal',15,100,100,'In the first turn, the attacker tucks in its head. The next turn, it head-butts at full steam.',NULL,40,NULL,0,'Enemy'),('Sky Attack','Flying',5,140,90,'The strongest FLYING-type attack. Energy is stored in the first turn, then fired the next turn.',NULL,43,NULL,0,'Enemy'),('Slam','Normal',20,80,75,'The attacker uses an appendage, like a tail, to slam the target hard.',NULL,NULL,NULL,0,'Enemy'),('Slash','Normal',20,70,100,'It has a high probability of a critical hit.',NULL,NULL,NULL,0,'Enemy'),('Sleep Powder','Grass',15,0,75,'Induces sleep. A Pokémon will stay asleep for several turns if an item isn\'t used to wake it.',NULL,NULL,NULL,0,'Enemy'),('Sludge','Poison',20,65,100,'Has a 40 percent chance of poisoning the target.',40,NULL,NULL,0,'Enemy'),('Smog','Poison',20,20,70,'Smog is spewed as a cloud. Has a 40 percent chance of poisoning the target.',40,NULL,NULL,0,'Enemy'),('Smokescreen','Normal',20,0,100,'Creates an obscuring cloud of smoke that reduces the enemy\'s accuracy.',NULL,NULL,NULL,0,'Enemy'),('Soft-Boiled','Normal',10,0,100,'Restores HP by 1/2 of the user\'s maximum HP. May also be used in the field.',NULL,41,NULL,0,'User'),('Solar Beam','Grass',10,120,100,'The strongest GRASS-type attack. Energy is absorbed in the first turn, then fired the next turn.',NULL,22,NULL,0,'Enemy'),('Sonic Boom','Normal',20,1,90,'It inflicts 20 HP of damage regardless of the target\'s type.',NULL,NULL,NULL,0,'Enemy'),('Spike Cannon','Normal',15,20,100,'A physical attack consisting of two to five consecutive hits. Highly accurate.',NULL,NULL,NULL,0,'Enemy'),('Splash','Normal',40,0,100,'A move that involves only flopping and Slashing around in front of the opponent. It has no effect.',NULL,NULL,NULL,0,'User'),('Spore','Grass',15,0,100,'Special spores are scattered from mushrooms. If the opponent inhales the spores, it will fall asleep.',NULL,NULL,NULL,0,'Enemy'),('Stomp','Normal',20,65,100,'Has a 30 percent chance of making the target flinch if it connects.',30,NULL,NULL,0,'Enemy'),('Strength','Normal',15,80,100,'A powerful attack. Also used for moving obstacles like boulders.',NULL,NULL,4,0,'Enemy'),('String Shot','Bug',40,0,95,'Strings are sprayed out and wrapped around the target to reduce its SPEED.',NULL,NULL,NULL,0,'Enemy'),('Struggle','Normal',10,50,100,'Used only if the user runs totally out of PP. The user is hit with 1/4 of the damage it inflicts.',NULL,NULL,NULL,0,'Enemy'),('Stun Spore','Grass',30,0,75,'A special move that causes paralysis. When paralyzed, the victim has a one-in-four chance of immobility.',NULL,NULL,NULL,0,'Enemy'),('Submission','Fighting',25,80,80,'The strongest FIGHTING attack. One quarter of the damage it inflicts comes back to hurt the attacker.',NULL,17,NULL,0,'Enemy'),('Substitute','Normal',10,0,100,'Uses 1/4 of the user\'s maximum HP to create a substitute that takes the opponent\'s attacks.',NULL,50,NULL,0,'User'),('Super Fang','Normal',10,1,90,'If it hits, this attack cuts the target\'s HP in half. Learned by Pokémon with developed fangs.',NULL,NULL,NULL,0,'Enemy'),('Supersonic','Normal',20,0,55,'Supersonic sound waves are used to confuse the target.',NULL,NULL,NULL,0,'Enemy'),('Surf','Water',15,95,100,'The power of this technique is strong and highly accurate.',NULL,NULL,3,0,'Enemy'),('Swift','Normal',20,60,100,'It is highly accurate, so it can be counted on to inflict damage.',NULL,39,NULL,0,'Enemy'),('Swords Dance','Normal',30,0,100,'A special move that greatly boosts the user\'s ATTACK power. Can normally be used up to three times.',NULL,3,NULL,0,'User'),('Tackle','Normal',35,35,95,'Many Pokémon know this attack right from the start.',NULL,NULL,NULL,0,'Enemy'),('Tail Whip','Normal',30,0,100,'A technique that lowers the target\'s DEFENSE. Useful against tough, armored Pokémon.',NULL,NULL,NULL,0,'Enemy'),('Take Down','Normal',20,90,85,'A charging attack. One quarter of the damage it inflicts comes back to hurt the attacker.',NULL,9,NULL,0,'Enemy'),('Teleport','Psychic',20,0,100,'A special technique for instantly escaping from wild Pokémon. Useful in the wild only. Outside of battle, teleport warps the player to the last healing spot visited.',NULL,30,NULL,0,'User'),('Thrash','Normal',20,90,100,'An attack that lasts two to three turns. Afterwards, the attacker becomes confused.',NULL,NULL,NULL,0,'Enemy'),('Thunder','Electric',10,120,70,'The strongest of all ELECTRIC-type attacks. Has a 10 percent chance of paralyzing the target.',10,25,NULL,0,'Enemy'),('Thunder Punch','Electric',15,75,100,'Has a 10 percent chance of paralyzing the target.',10,NULL,NULL,0,'Enemy'),('Thunder Shock','Electric',30,40,100,'Has a 10 percent chance of paralyzing the target.',NULL,NULL,NULL,0,'Enemy'),('Thunder Wave','Electric',20,0,100,'A special move that causes paralysis. When paralyzed, the victim has a one-in-four chance of immobility.',NULL,45,NULL,0,'Enemy'),('Thunderbolt','Electric',15,95,100,'Has a 10 percent chance of paralyzing the target.',10,24,NULL,0,'Enemy'),('Toxic','Poison',10,0,85,'A technique that badly poisons the target. The amount of damage from the poison increases every turn.',NULL,6,NULL,0,'Enemy'),('Transform','Normal',10,0,100,'Transforms the user into a copy of the target, including the type. All moves have only five PP each.',NULL,NULL,NULL,0,'Enemy'),('Tri Attack','Normal',10,80,100,'A triangular field of energy is created and launched at the target.',NULL,49,NULL,0,'Enemy'),('Twineedle','Bug',20,25,100,'An attack that strikes twice. The target may occasionally become poisoned.',NULL,NULL,NULL,0,'Enemy'),('Vice Grip','Normal',30,55,100,'An attack used only by Pokémon with pincers. The target is gripped and injured.',NULL,NULL,NULL,0,'Enemy'),('Vine Whip','Grass',10,35,100,'The Pokémon uses its cruel whips to strike the opponent.',NULL,NULL,NULL,0,'Enemy'),('Water Gun','Water',25,40,100,'Stronger than bubble. Many water-type Pokémon learn this move.',NULL,12,NULL,0,'Enemy'),('Waterfall','Water',15,80,100,'The target is hit with a blow packing the power of fish traveling up waterfalls.',NULL,NULL,NULL,0,'Enemy'),('Whirlwind','Normal',20,0,85,'Generates a powerful wind that blows away wild Pokémon. Useful in the wild only.',NULL,4,NULL,0,'Enemy'),('Wing Attack','Flying',35,35,100,'The attacking Pokémon spreads its wings and charges at the target.',NULL,NULL,NULL,0,'Enemy'),('Withdraw','Water',40,0,100,'Used mainly by Pokémon with shells. By withdrawing into the shell, DEFENSE is increased.',NULL,NULL,NULL,0,'User'),('Wrap','Normal',20,15,85,'Traps and squeezes the target over two to five turns. The target cannot move while under attack.',NULL,NULL,NULL,0,'Enemy');
/*!40000 ALTER TABLE `Moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MovesFromLeveling`
--

DROP TABLE IF EXISTS `MovesFromLeveling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MovesFromLeveling` (
  `Pokemon` varchar(45) NOT NULL,
  `Move` varchar(45) NOT NULL,
  `Level` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pokemon`,`Move`),
  KEY `fk_move_level_idx` (`Move`),
  CONSTRAINT `fk_move_level` FOREIGN KEY (`Move`) REFERENCES `Moves` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_move_level` FOREIGN KEY (`Pokemon`) REFERENCES `Pokemon` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains list of moves from leveling naturally';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovesFromLeveling`
--

LOCK TABLES `MovesFromLeveling` WRITE;
/*!40000 ALTER TABLE `MovesFromLeveling` DISABLE KEYS */;
INSERT INTO `MovesFromLeveling` VALUES ('Bulbasaur','Growl',NULL),('Bulbasaur','Growth',34),('Bulbasaur','Leech Seed',7),('Bulbasaur','Poison Powder',20),('Bulbasaur','Razor Leaf',27),('Bulbasaur','Sleep Powder',41),('Bulbasaur','Solar Beam',48),('Bulbasaur','Tackle',NULL),('Bulbasaur','Vine Whip',13),('Ivysaur','Growl',NULL),('Ivysaur','Growth',38),('Ivysaur','Leech Seed',7),('Ivysaur','Poison Powder',21),('Ivysaur','Razor Leaf',30),('Ivysaur','Sleep Powder',46),('Ivysaur','Solar Beam',54),('Ivysaur','Tackle',NULL),('Ivysaur','Vine Whip',13),('Venusaur','Growl',NULL),('Venusaur','Growth',43),('Venusaur','Leech Seed',7),('Venusaur','Poison Powder',22),('Venusaur','Razor Leaf',30),('Venusaur','Sleep Powder',55),('Venusaur','Solar Beam',65),('Venusaur','Tackle',NULL),('Venusaur','Vine Whip',13);
/*!40000 ALTER TABLE `MovesFromLeveling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MovesFromMachine`
--

DROP TABLE IF EXISTS `MovesFromMachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MovesFromMachine` (
  `Pokemon` varchar(45) NOT NULL,
  `Move` varchar(45) NOT NULL,
  PRIMARY KEY (`Pokemon`,`Move`),
  KEY `fk_move_machine_idx` (`Move`),
  CONSTRAINT `fk_move_machine` FOREIGN KEY (`Move`) REFERENCES `Moves` (`Name`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pokemon_move_machine` FOREIGN KEY (`Pokemon`) REFERENCES `Pokemon` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains information of which TMs and HMs a Pokemon can learn.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovesFromMachine`
--

LOCK TABLES `MovesFromMachine` WRITE;
/*!40000 ALTER TABLE `MovesFromMachine` DISABLE KEYS */;
INSERT INTO `MovesFromMachine` VALUES ('Bulbasaur','Bide'),('Ivysaur','Bide'),('Venusaur','Bide'),('Bulbasaur','Body Slam'),('Ivysaur','Body Slam'),('Venusaur','Body Slam'),('Bulbasaur','Cut'),('Ivysaur','Cut'),('Venusaur','Cut'),('Bulbasaur','Double Team'),('Ivysaur','Double Team'),('Venusaur','Double Team'),('Bulbasaur','Double-Edge'),('Ivysaur','Double-Edge'),('Venusaur','Double-Edge'),('Venusaur','Hyper Beam'),('Bulbasaur','Mega Drain'),('Ivysaur','Mega Drain'),('Venusaur','Mega Drain'),('Bulbasaur','Mimic'),('Ivysaur','Mimic'),('Venusaur','Mimic'),('Bulbasaur','Rage'),('Ivysaur','Rage'),('Venusaur','Rage'),('Bulbasaur','Reflect'),('Ivysaur','Reflect'),('Venusaur','Reflect'),('Bulbasaur','Rest'),('Ivysaur','Rest'),('Venusaur','Rest'),('Bulbasaur','Solar Beam'),('Ivysaur','Solar Beam'),('Venusaur','Solar Beam'),('Bulbasaur','Substitute'),('Ivysaur','Substitute'),('Venusaur','Substitute'),('Bulbasaur','Swords Dance'),('Ivysaur','Swords Dance'),('Venusaur','Swords Dance'),('Bulbasaur','Take Down'),('Ivysaur','Take Down'),('Venusaur','Take Down'),('Bulbasaur','Toxic'),('Ivysaur','Toxic'),('Venusaur','Toxic');
/*!40000 ALTER TABLE `MovesFromMachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PokeDexEntry`
--

DROP TABLE IF EXISTS `PokeDexEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PokeDexEntry` (
  `Pokemon` varchar(45) NOT NULL,
  `Game` varchar(45) NOT NULL,
  `Entry` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Pokemon`,`Game`),
  CONSTRAINT `fk_pokemon_pokedex` FOREIGN KEY (`Pokemon`) REFERENCES `Pokemon` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains Pokedex entry for a given Pokemon and Game.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PokeDexEntry`
--

LOCK TABLES `PokeDexEntry` WRITE;
/*!40000 ALTER TABLE `PokeDexEntry` DISABLE KEYS */;
INSERT INTO `PokeDexEntry` VALUES ('Bulbasaur','Red & Blue','A strange seed was planted on its back at bir'),('Bulbasaur','Yellow','It can go for days without eating a single mo'),('Eevee','Red & Blue','ts genetic code is irregular. It may mutate i'),('Eevee','Yellow','Its genetic code is unstable, so it could evo'),('Flareon','Red & Blue','When storing thermal energy in its body, its '),('Flareon','Yellow','It has a flame chamber inside its body. It in'),('Ivysaur','Red & Blue','When the bulb on its back grows large, it app'),('Ivysaur','Yellow','The bulb on its back grows by drawing energy.'),('Jolteon','Red & Blue','It accumulates negative ions in the atmospher'),('Jolteon','Yellow','	A sensitive Pokémon that easily becomes sad '),('Mew','Red & Blue','So rare that it is still said to be a mirage '),('Mew','Yellow','When viewed through a microscope, this Pokémo'),('Vaporeon','Red & Blue','Lives close to water. Its long tail is ridged'),('Vaporeon','Yellow','	Its cell structure is similar to water molec'),('Venusaur','Red & Blue','The plant blooms when it is absorbing solar e'),('Venusaur','Yellow','The flower on its back catches the sun\'s rays');
/*!40000 ALTER TABLE `PokeDexEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pokemon`
--

DROP TABLE IF EXISTS `Pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pokemon` (
  `Name` varchar(45) NOT NULL,
  `NationalIDNumber` int(11) NOT NULL,
  `Type1` varchar(45) NOT NULL,
  `Type2` varchar(45) DEFAULT NULL,
  `Classification` varchar(45) NOT NULL,
  `Height` varchar(45) NOT NULL,
  `Weight` varchar(45) NOT NULL,
  `CaptureRate` int(11) NOT NULL,
  `EvolvedFrom` varchar(45) DEFAULT NULL,
  `BaseHP` int(11) NOT NULL,
  `BaseAttack` int(11) NOT NULL,
  `BaseDefense` int(11) NOT NULL,
  `BaseSpecial` int(11) NOT NULL,
  `BaseSpeed` int(11) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Holds stat and bio data on a Pokemon.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pokemon`
--

LOCK TABLES `Pokemon` WRITE;
/*!40000 ALTER TABLE `Pokemon` DISABLE KEYS */;
INSERT INTO `Pokemon` VALUES ('Bulbasaur',1,'Grass','Poison','Seed Pokemon','2\'04\"','15.2 lbs',45,NULL,45,49,49,65,45),('Eevee',133,'Normal',NULL,'Evolution Pokemon','1\'00\"','14.3 lbs',45,NULL,55,55,50,65,55),('Flareon',136,'Fire',NULL,'Flame Pokemon','2\'11\"','55.1 lbs',45,'Eevee',65,130,60,110,65),('Ivysaur',2,'Grass','Poison','Seed Pokemon','3\'03\"','28.7 lbs',45,'Bulbasaur',60,62,63,80,60),('Jolteon',135,'Electric',NULL,'Lightning Pokemon','2\'07\"','54.0 lbs',45,'Eevee',65,65,60,110,130),('Mew',151,'Psychic',NULL,'New Species Pokemon','1\'04\"','8.8 lbs',45,NULL,100,100,100,100,100),('Vaporeon',134,'Water',NULL,'Bubble Jet Pokemon','3\'03\"','63.9 lbs',45,'Eevee',130,65,60,110,65),('Venusaur',3,'Grass','Poison','Seed Pokemon','6\'07\"','220.5 lbs',45,'Ivysaur',80,82,83,100,80);
/*!40000 ALTER TABLE `Pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `PokemonEvolutionTree`
--

DROP TABLE IF EXISTS `PokemonEvolutionTree`;
/*!50001 DROP VIEW IF EXISTS `PokemonEvolutionTree`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `PokemonEvolutionTree` AS SELECT 
 1 AS `Pokemon`,
 1 AS `EvolvedFrom`,
 1 AS `EvolvesTo`,
 1 AS `EvolutionLevel`,
 1 AS `OtherEvolutionMethod`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `PokemonLocation`
--

DROP TABLE IF EXISTS `PokemonLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PokemonLocation` (
  `Pokemon` varchar(45) NOT NULL,
  `Game` varchar(45) NOT NULL,
  `Location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Pokemon`,`Game`),
  CONSTRAINT `fk_pokemon` FOREIGN KEY (`Pokemon`) REFERENCES `Pokemon` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Information on where a Pokemon is located.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PokemonLocation`
--

LOCK TABLES `PokemonLocation` WRITE;
/*!40000 ALTER TABLE `PokemonLocation` DISABLE KEYS */;
INSERT INTO `PokemonLocation` VALUES ('Bulbasaur','Blue','Starter Pokemon'),('Bulbasaur','Red','Starter Pokemon'),('Bulbasaur','Yellow','Gift in Cerulean City'),('Eevee','Blue','Gift in Celadon City'),('Eevee','Red','Gift in Celadon City'),('Eevee','Yellow','Gift in Celadon City'),('Flareon','Blue','Evolve Eevee'),('Flareon','Red','Evolve Eevee'),('Flareon','Yellow','Evolve Eevee'),('Ivysaur','Blue','Evolve Bulbasaur'),('Ivysaur','Red','Evolve Bulbasaur'),('Ivysaur','Yellow','Evolve Bulbasaur'),('Jolteon','Blue','Evolve Eevee'),('Jolteon','Red','Evolve Eevee'),('Jolteon','Yellow','Evolve Eevee'),('Mew','Blue','Event Only'),('Mew','Red','Event Only'),('Mew','Yellow','Event Only'),('Vaporeon','Blue','Evolve Eevee'),('Vaporeon','Red','Evolve Eevee'),('Vaporeon','Yellow','Evolve Eevee'),('Venusaur','Blue','Evolve Ivysaur'),('Venusaur','Red','Evolve Ivysaur'),('Venusaur','Yellow','Evolve Ivysaur');
/*!40000 ALTER TABLE `PokemonLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resists`
--

DROP TABLE IF EXISTS `Resists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resists` (
  `UserType1` varchar(45) NOT NULL,
  `UserType2` varchar(45) NOT NULL DEFAULT '',
  `EnemyMoveType` varchar(45) NOT NULL,
  `Multiplier` decimal(3,2) NOT NULL,
  PRIMARY KEY (`UserType1`,`UserType2`,`EnemyMoveType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resists`
--

LOCK TABLES `Resists` WRITE;
/*!40000 ALTER TABLE `Resists` DISABLE KEYS */;
INSERT INTO `Resists` VALUES ('Bug','','Fighting',0.50),('Bug','','Grass',0.50),('Bug','','Ground',0.50),('Bug','Flying','Bug',0.50),('Bug','Flying','Fighting',0.25),('Bug','Flying','Grass',0.25),('Bug','Flying','Ground',0.00),('Bug','Grass','Elecctric',0.50),('Bug','Grass','Fighting',0.50),('Bug','Grass','Grass',0.25),('Bug','Grass','Ground',0.25),('Bug','Grass','Water',0.50),('Bug','Poison','Fighting',0.25),('Bug','Poison','Grass',0.25),('Dragon','','Electric',0.50),('Dragon','','Fire',0.50),('Dragon','','Grass',0.50),('Dragon','','Water',0.50),('Dragon','Flying','Bug',0.50),('Dragon','Flying','Fighting',0.50),('Dragon','Flying','Fire',0.50),('Dragon','Flying','Grass',0.25),('Dragon','Flying','Ground',0.00),('Dragon','Flying','Water',0.50),('Electric','','Electric',0.50),('Electric','','Flying',0.50),('Electric','Flying','Bug',0.50),('Electric','Flying','Fighting',0.50),('Electric','Flying','Flying',0.50),('Electric','Flying','Grass',0.50),('Electric','Flying','Ground',0.00),('Fighting','','Bug',0.50),('Fighting','','Rock',0.50),('Fire','','Bug',0.50),('Fire','','Fire',0.50),('Fire','','Grass',0.50),('Fire','Flying','Bug',0.25),('Fire','Flying','Fighting',0.50),('Fire','Flying','Fire',0.50),('Fire','Flying','Grass',0.25),('Fire','Flying','Ground',0.00),('Flying','','Bug',0.50),('Flying','','Fighting',0.50),('Flying','','Grass',0.50),('Flying','','Ground',0.00),('Ghost','','Fighting',0.00),('Ghost','','Normal',0.00),('Ghost','','Poison',0.50),('Ghost','Poison','Fighting',0.00),('Ghost','Poison','Grass',0.50),('Ghost','Poison','Normal',0.00),('Ghost','Poison','Poison',0.25),('Grass','','Electric',0.50),('Grass','','Grass',0.50),('Grass','','Ground',0.50),('Grass','','Water',0.50),('Grass','Poison','Electric',0.50),('Grass','Poison','Fighting',0.50),('Grass','Poison','Grass',0.25),('Grass','Poison','Water',0.50),('Grass','Psychic','Electric',0.50),('Grass','Psychic','Fighting',0.50),('Grass','Psychic','Ghost',0.00),('Grass','Psychic','Grass',0.50),('Grass','Psychic','Ground',0.50),('Grass','Psychic','Psychic',0.50),('Grass','Psychic','Water',0.50),('Ground','','Electric',0.00),('Ground','','Poison',0.50),('Ground','','Rock',0.50),('Ice','','Ice',0.50),('Ice','Flying','Bug',0.50),('Ice','Flying','Grass',0.50),('Ice','Flying','Ground',0.00),('Ice','Psychic','Ghost',0.00),('Ice','Psychic','Ice',0.50),('Ice','Psychic','Psychic',0.50),('Normal','','Ghost',0.00),('Normal','Flying','Bug',0.50),('Normal','Flying','Ghost',0.00),('Normal','Flying','Grass',0.50),('Normal','Flying','Ground',0.00),('Poison','','Fighting',0.50),('Poison','','Grass',0.50),('Poison','','Poison',0.50),('Poison','Flying','Fighting',0.25),('Poison','Flying','Grass',0.25),('Poison','Flying','Ground',0.00),('Poison','Flying','Poison',0.50),('Poison','Ground','Electric',0.00),('Poison','Ground','Fighting',0.50),('Poison','Ground','Poison',0.25),('Poison','Ground','Rock',0.50),('Psychic','','Fighting',0.50),('Psychic','','Ghost',0.00),('Psychic','','Psychic',0.50),('Rock','','Fire',0.50),('Rock','','Flying',0.50),('Rock','','Normal',0.50),('Rock','','Poison',0.50),('Rock','Flying','Bug',0.50),('Rock','Flying','Fire',0.50),('Rock','Flying','Flying',0.50),('Rock','Flying','Ground',0.00),('Rock','Flying','Normal',0.50),('Rock','Flying','Poison',0.50),('Rock','Ground','Electric',0.00),('Rock','Ground','Fire',0.50),('Rock','Ground','Flying',0.50),('Rock','Ground','Normal',0.50),('Rock','Ground','Poison',0.25),('Rock','Ground','Rock',0.50),('Water','','Fire',0.50),('Water','','Ice',0.50),('Water','','Water',0.50),('Water','Fighting','Bug',0.50),('Water','Fighting','Fire',0.50),('Water','Fighting','Ice',0.50),('Water','Fighting','Rock',0.50),('Water','Fighting','Water',0.50),('Water','Flying','Bug',0.50),('Water','Flying','Fighting',0.50),('Water','Flying','Fire',0.50),('Water','Flying','Ground',0.00),('Water','Flying','Water',0.50),('Water','Ice','Ice',0.25),('Water','Ice','Water',0.50),('Water','Poison','Fighting',0.50),('Water','Poison','Fire',0.50),('Water','Poison','Ice',0.50),('Water','Poison','Poison',0.50),('Water','Poison','Water',0.50),('Water','Psychic','Fighting',0.50),('Water','Psychic','Fire',0.50),('Water','Psychic','Ghost',0.00),('Water','Psychic','Ice',0.50),('Water','Psychic','Psychic',0.50),('Water','Psychic','Water',0.50);
/*!40000 ALTER TABLE `Resists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WeakTo`
--

DROP TABLE IF EXISTS `WeakTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WeakTo` (
  `UserType1` varchar(45) NOT NULL,
  `UserType2` varchar(45) NOT NULL,
  `EnemyMoveType` varchar(45) NOT NULL,
  `Multiplier` decimal(2,1) NOT NULL,
  PRIMARY KEY (`UserType1`,`UserType2`,`EnemyMoveType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WeakTo`
--

LOCK TABLES `WeakTo` WRITE;
/*!40000 ALTER TABLE `WeakTo` DISABLE KEYS */;
INSERT INTO `WeakTo` VALUES ('Bug','','Fire',2.0),('Bug','','Flying',2.0),('Bug','','Poison',2.0),('Bug','','Rock',2.0),('Bug','Flying','Electric',2.0),('Bug','Flying','Fire',2.0),('Bug','Flying','Flying',2.0),('Bug','Flying','Ice',2.0),('Bug','Flying','Poison',2.0),('Bug','Flying','Rock',4.0),('Bug','Grass','Bug',2.0),('Bug','Grass','Fire',4.0),('Bug','Grass','Flying',4.0),('Bug','Grass','Ice',2.0),('Bug','Grass','Poison',4.0),('Bug','Grass','Rock',2.0),('Bug','Poison','Bug',2.0),('Bug','Poison','Fire',2.0),('Bug','Poison','Flying',2.0),('Bug','Poison','Psychic',2.0),('Bug','Poison','Rock',2.0),('Dragon','','Dragon',2.0),('Dragon','','Ice',2.0),('Dragon','Flying','Dragon',2.0),('Dragon','Flying','Ice',4.0),('Dragon','Flying','Rock',2.0),('Electric','','Ground',2.0),('Electric','Flying','Ice',2.0),('Electric','Flying','Rock',2.0),('Fighting','','Flying',2.0),('Fighting','','Psychic',2.0),('Fire','','Ground',2.0),('Fire','','Rock',2.0),('Fire','','Water',2.0),('Fire','Flying','Electric',2.0),('Fire','Flying','Ice',2.0),('Fire','Flying','Rock',4.0),('Fire','Flying','Water',2.0),('Flying','','Electric',2.0),('Flying','','Ice',2.0),('Flying','','Rock',2.0),('Ghost','','Ghost',2.0),('Ghost','Poison','Ghost',2.0),('Ghost','Poison','Ground',2.0),('Ghost','Poison','Psychic',2.0),('Grass','','Bug',2.0),('Grass','','Fire',2.0),('Grass','','Flying',2.0),('Grass','','Ice',2.0),('Grass','','Poison',2.0),('Grass','Poison','Bug',2.0),('Grass','Poison','Fire',2.0),('Grass','Poison','Flying',2.0),('Grass','Poison','Ice',2.0),('Grass','Poison','Psychic',2.0),('Grass','Psychic','Bug',4.0),('Grass','Psychic','Fire',2.0),('Grass','Psychic','Flying',2.0),('Grass','Psychic','Ice',2.0),('Grass','Psychic','Poison',2.0),('Ground','','Grass',2.0),('Ground','','Ice',2.0),('Ground','','Water',2.0),('Ice','','Fighting',2.0),('Ice','','Fire',2.0),('Ice','','Rock',2.0),('Ice','Flying','Electric',2.0),('Ice','Flying','Fire',2.0),('Ice','Flying','Rock',4.0),('Ice','Psychic','Bug',2.0),('Ice','Psychic','Fire',2.0),('Ice','Psychic','Rock',2.0),('Normal','','Fighting',2.0),('Normal','Flying','Electric',2.0),('Normal','Flying','Ice',2.0),('Normal','Flying','Rock',2.0),('Poison','','Bug',2.0),('Poison','','Ground',2.0),('Poison','','Psychic',2.0),('Poison','Flying','Electric',2.0),('Poison','Flying','Ice',2.0),('Poison','Flying','Psychic',2.0),('Poison','Flying','Rock',2.0),('Poison','Ground','Bug',2.0),('Poison','Ground','Ground',2.0),('Poison','Ground','Ice',2.0),('Poison','Ground','Psychic',2.0),('Poison','Ground','Water',2.0),('Psychic','','Bug',2.0),('Rock','','Fighting',2.0),('Rock','','Grass',2.0),('Rock','','Ground',2.0),('Rock','','Water',2.0),('Rock','Flying','Electric',2.0),('Rock','Flying','Ice',2.0),('Rock','Flying','Rock',2.0),('Rock','Flying','Water',2.0),('Rock','Ground','Fighting',2.0),('Rock','Ground','Grass',4.0),('Rock','Ground','Ground',2.0),('Rock','Ground','Ice',2.0),('Rock','Ground','Water',4.0),('Water','','Electric',2.0),('Water','','Grass',2.0),('Water','Fighting','Electric',2.0),('Water','Fighting','Flying',2.0),('Water','Fighting','Grass',2.0),('Water','Fighting','Psychic',2.0),('Water','Flying','Electric',4.0),('Water','Flying','Rock',2.0),('Water','Ice','Electric',2.0),('Water','Ice','Fighting',2.0),('Water','Ice','Grass',2.0),('Water','Ice','Rock',2.0),('Water','Poison','Bug',2.0),('Water','Poison','Electric',2.0),('Water','Poison','Ground',2.0),('Water','Poison','Psychic',2.0),('Water','Psychic','Bug',2.0),('Water','Psychic','Electric',2.0),('Water','Psychic','Grass',2.0);
/*!40000 ALTER TABLE `WeakTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Gen1PokemonApp'
--

--
-- Dumping routines for database 'Gen1PokemonApp'
--

--
-- Final view structure for view `PokemonEvolutionTree`
--

/*!50001 DROP VIEW IF EXISTS `PokemonEvolutionTree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PokemonEvolutionTree` AS select `pokemon`.`Name` AS `Pokemon`,`pokemon`.`EvolvedFrom` AS `EvolvedFrom`,`evolves`.`PokemonEvolution` AS `EvolvesTo`,`evolves`.`EvolutionLevel` AS `EvolutionLevel`,`evolves`.`OtherEvolutionMethod` AS `OtherEvolutionMethod` from (`Pokemon` `pokemon` left join `EvolveTo` `evolves` on((`pokemon`.`Name` = `evolves`.`Pokemon`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-04 18:59:39
