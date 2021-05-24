-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 12:19 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daisu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `detailid` int(10) UNSIGNED NOT NULL,
  `itemdescription` mediumtext NOT NULL,
  `itemid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`detailid`, `itemdescription`, `itemid`) VALUES
(1, 'Vertical walls and a rectangular floor plan maximize livable space\nStable, freestanding design features 2 hubbed pole assemblies, pole clips and sleeves\n2 large doors with zipper sliders and bug-proof mesh windows\nBug-proof mesh wall panels\nSingle vestibule and rain-blocking awning\nMultiple interior storage options\nCenter divider wall zips into place to create two rooms\nSeam-sealed waterproof polyester fly and cut-in floor\nConnect Tech zipper attachment lets you add more living space or storage with add-on Garage accessory, sold separately\nIncludes a backpack carry bag with pockets for poles and stakes, along with 8 stakes, 6 guylines with tighteners and a pole repair tube\nFootprint sold separately', 1),
(2, 'Spacious dome design offers great livability\r\nMesh door, ceiling and side panels increase ventilation to help reduce condensation buildup\r\n2 large doors provide easy access; roomy vestibules protect entrances and store your gear out of the rain\r\nFront dual-zipper vestibule door lets you create a covered portico when coupled with trekking poles (sold separately)\r\nCombination pole sleeve and clip system combines advantages of both designs, and allows swift, freestanding setup even in the wind; DAC DA17 poles are strong and reliable\r\nUV-resistant, seam-taped polyester rainfly provides full coverage and doesn\'t stretch or expand when wet, ensuring a consistently taut pitch\r\nHeavyweight oxford nylon canopy floor is fully taped for complete protection\r\nEntryway doormat helps keep tent interior clean\r\nThe Marmot Limestone 6P Tent comes with stuff sacks, stakes and guylines/tighteners', 2),
(3, 'mtnGLO™ Tent Lighting Technology features LED lights integrated into the tent body, so you can experience ambient light in your shelter with the click of a button\r\nLED light strand is durable and flexible enough to withstand repeated tent pitching and stuffing\r\nLEDs illuminate the interior of your tent with 90+ hrs. of hands-free light to sort gear, read, eat and play cards without blinding your friend with a headlamp\r\nSimple push-button controller has 3 settings: on, off and 50% brightness; requires 3 AAA batteries (sold separately)\r\n2 doors and 2 vestibules; stormflaps on vestibule zippers\r\nDAC Featherlite NSL and NFL poles with lightweight hubs; steep walls and crossover pole increase interior living space\r\n2 media pockets located above sleeping area enable clean earbud cord routing from phones or other devices; 4 interior mesh pockets keep small items organized\r\nGear loft loops are compatible with Big Agnes Entertainment Center and PowerCase mtnGLO gear lofts (sold separately)\r\nAll seams taped with waterproof, solvent-free polyurethane tape (no PVC or VOCs)\r\nReflective guylines and webbing on tent corners\r\nComes with 8 Superlight aluminum J stakes\r\nSave weight and create a minimalist shelter by using just the rainfly, poles and footprint (sold separately)', 3),
(4, 'Large double door and rear D-shaped door lead to 2 vestibules to keep your gear dry in wet weather\r\nDAC Press-Fit poles and Velocity aluminum 7000 ridge pole are simple to set up; Body Zone pre-bends create vertical walls for a more spacious living area\r\nColor-coded Easy Pitch clips and poles; strategic clip placement enhances interior volume\r\nSeam-taped, full-coverage fly with vents\r\nSeam-taped, catenary cut floor\r\nInterior pockets for small-gear organization; Lamp Shade pocket securely holds your headlamp to provide ambient light\r\nJingle-free nylon zipper pulls\r\nFootprint included', 4),
(5, 'Fly design allows sides and ends to be rolled up to maximize views and airflow; everything also rolls down quickly if a storm blows in\r\nCurved zipper tracks on fly operate smoothly; fly\'s 4 ceiling vents provide airflow to prevent condensation buildup\r\nHubbed pole assembly simplifies setup\r\nREI-exclusive tension-truss architecture creates stable vertical sidewalls and generous headroom while minimizing pole weight\r\n2 doors and 2 vestibules offer easy access and additional covered storage\r\nPockets and hang loops help organize the interior\r\nIncludes guylines with tighteners, stakes and pole-repair tube, compression stuff sack, pole bag and stake bag\r\nFly / footprint minimalist pitch option lets you leave the tent at home and use the fly, poles and footprint (sold separately) as a lightweight shelter\r\nREI Half Dome 2 Footprint is sold separately', 5),
(6, 'Wide-mouth door orientation gives all sleepers equal access to the 2 doors—no need to crawl over a tentmate to get in and out\r\nLarge doors have solid fabric for privacy and mesh for ventilation; doors tuck into roof pockets\r\n2 roof vents help control condensation; zippered access allows campers to adjust the vents from inside the tent\r\nColor coding and equal-length poles simplify setup\r\nLarge pole-supported vestibule and a smaller stake-out vestibule provide covered storage front and rear\r\nCoated 150-denier polyester oxford floor is abrasion- and puncture-resistant\r\nFull-coverage polyester rainfly is resistant to stretching and UV rays\r\nMultiple pockets and hang loops help organize the interior\r\nIncludes a convenient backpack-style storage sack, stakes, guylines and tighteners, as well as a pole-repair tube, a pole bag and a stake bag\r\nThe REI Base Camp 6 Footprint is sold separately', 39),
(7, 'Heatseeker™ Eco insulation offers a great warmth-to-weight ratio, is highly compressible and is extremely durable; composed of 30% post-consumer recycled material\r\nZipper zips all the way around the footbox and allows the sleeping bag to be opened up completely for use as a comforter', 6),
(8, 'REI-exclusive insulation uses a mixture of conjugated and microfibers to create the right balance of compression, recovery, warmth, loft, and softness\r\nDesigned for women, the Carina is wider at the hip and narrower at the shoulder for thermal efficiency\r\nHood is designed to hold a backpacking pillow (not included)\r\nDraft collar, face muffler and full draft tube hold in warmth, keep out cold\r\nInterior pocket for stashing small essentials\r\nDifferentiated draw cords (one round, one flat) let you adjust the hood and neck easily in the dark\r\nPad loops hold your sleeping pad (not included) in place\r\nShingled construction with overlapping layers eliminates cold spots\r\nWater- and abrasion-resistant ripstop nylon shell\r\nAnti-snag zipper guard keeps zipper operating smoothly\r\nComes with a compression stuff sack for packing and a roomy cotton sack for breathable storage', 7),
(9, 'With a European Norm (EN) lower-limit rating of 19°F, this bag is suitable for 3-season use\r\nWater-repellent 600-fill-power duck down offers excellent loft and warmth\r\nRipstop nylon shell also features a durable water repellent finish to further protect the down fill\r\nRelaxed shoulder-to-hip fit is comfortable for multi-position sleepers\r\nContoured hood, insulated face muffler and full-length draft tube all work to keep warmth in\r\nDifferentiated hood and neck drawcords simplify adjustments; antisnag zipper works smoothly\r\nBag has a stash pocket under the collar\r\nPad loops let you strap the bag to your sleeping pad (straps and pad not included)\r\nMost REI backpacking bags can be zipped to other REI backpacking bags; women\'s bags zip on the right, unisex on the left\r\nThe REI Radiant Sleeping Bag includes a nylon stuff sack and a large cotton storage bag', 8),
(10, '800-fill ProDown is enhanced with a hydrophobic finish that improves warmth by allowing it to dry faster and repel moisture up to 10 times longer than untreated down\r\nGenerous cut allows room to wear more layers or to shift about in the bag\r\nFull draft collar and integrated draft overlap prevent heat loss\r\nWater-resistant Neovent Air fabric on hood, footbox and back helps keep insulation dry when touching wet tent walls\r\nTrapezoidal side baffle prevents down migration\r\nCenter zipper for easier access\r\nHood cinch-cord seals out the cold\r\nInternal pocket for insulated storage\r\nCompression sack and storage sack included', 9),
(11, 'Heatseeker™ Eco insulation offers a great warmth-to-weight ratio, is highly compressible and is extremely durable; composed of 30% post-consumer recycled material\r\nZipper zips all the way around the footbox and allows the sleeping bag to be opened up completely for use as a comforter', 10),
(12, 'With a European Norm (EN) comfort rating of 23°F, this bag is suitable for 3-season use\r\nREI double-protection design combines a polymer-coated down fill with waterproof/breathable fabric at the hood, sides and footbox, the areas likely to touch a damp tent wall\r\nDesigned to fit a woman\'s body, this bag offers increased room at hips, decreased room at shoulders and extra insulation in critical heat-loss areas\r\nWater-repellent 700-fill-power duck down offers superior loft and warmth\r\nRipstop nylon shell also features a durable water repellent finish to further protect the down fill\r\nPerformance fit keeps weight low and thermal efficiency high\r\nREI in-the-round design puts vertical baffles in side walls to wrap you in warmth and create a better fit than bags that use only horizontal baffles\r\nContoured hood, insulated face muffler and full-length draft tube all work to keep warmth in\r\nDifferentiated hood and neck drawcords simplify adjustments\r\nMost REI backpacking bags can be zipped to other REI backpacking bags; women\'s bags zip on the right, unisex on the left\r\nThe women\'s REI Joule Sleeping Bag includes a nylon stuff sack and a large cotton storage bag', 40),
(13, 'High-strength, breathable 70-denier nylon taffeta and triple interlocking stitching holds up to use and abuse\r\nLightweight aluminum wiregate carabiners can be clipped to any solid anchor points; compatible with most hammock suspension systems (suspension system sold separately)\r\nPacks down to the size of a grapefruit\r\nMaximum capacity of 400 lbs.\r\nHammock includes a built-in stuff sack\r\nPlease note: ENO uses all fabric remnants in the production of their hammocks so the color combination of the hammock you receive may vary slightly from the picture', 11),
(14, 'Ripstop nylon shell has a Durable Water Repellent coating to help shed moisture and keep the down fill dry\r\nShockcord suspension allows the Blaze to work with all ENO hammocks (sold separately)\r\nENO Blaze hammock underquilt includes a stuff sack and a cotton storage bag; keep the underquilt in the cotton bag for long-term storage', 41),
(15, 'One Link system includes a DoubleNest hammock, ProFly™ rain tarp, Guardian bug net, Atlas Suspension straps, 2 steel carabiners and 4 aluminum stakes\r\nDoubleNest hammock has room for 2 adults yet it packs up to the size of a grapefruit for convenient transportation\r\nHigh-strength, breathable woven nylon and triple interlocking stitching holds up to use and abuse; has a maximum capacity of 400 lbs.\r\nPolyurethane-treated ripstop nylon rain tarp offers long-lasting wear with excellent water-shedding capabilities; use the 4 stakes when setting up the tarp\r\nGuardian bug net is quick and easy to set up and keeps bugs away\r\nAtlas Hammock Suspension straps help you set up the hammock around large trees and posts, and they offer 30 combined adjustment points so you get it set up just right\r\nAll items in the ENO One Link™ Hammock Shelter system come packed together in a stuff sack so you won\'t leave anything at home', 12),
(16, 'Quick and easy setup minimizes your exposure to annoying insects\r\nBuilt-in compression stuff sack makes for easy transport\r\nStuff sacks come in assorted colors; color of the bug net is black\r\nCompatible with all ENO hammocks', 13),
(17, '750-fill-power water-resistant DownTek insulation keeps you warm in damp conditions\r\nProprietary ripstop nylon fabric reflects your body heat and regulates temperature\r\nInternal thermal vents evenly distribute heat and help you warm up quickly\r\nInternal adjustments provide the perfect contour to your body, eliminating cold spots\r\nRated down to 30°F\r\nEach purchase supports Kammock\'s Give Adventure initiative to donate 1% of their revenue to support youth in leadership training through outdoor adventure\r\nKammok is a member of 1% For The Planet, an organization building, supporting and activating an alliance of businesses that are committed to creating a healthy planet', 14),
(18, 'As the most camouflaged hammock shelter system from ENO, it\'s great for hunting and fishing trips\r\nCustomizable system allows you to add or take away additional products to tailor it to every trip\r\nCamo hammock is spacious for 1 and packs up to the size of a softball for convenient transportation\r\nHigh-strength, breathable woven nylon and triple interlocking stitching holds up to use and abuse; has a maximum capacity of 400 lbs.\r\nAtlas Hammock Suspension straps help you set up the hammock around large trees and posts, and they offer 30 combined adjustment points so you get it set up just right\r\nGuardian bug net is quick and easy to set up and keeps bugs away\r\nNylon camo carry case for easy storage and portability', 15),
(19, 'Horizontally cored foam reduces weight and bulk\r\n3.5-inch thickness provides ample cushioning\r\n2 quick-closing, high-flow valves\r\nSoft, stretch polyester top\r\n150-denier polyester bottom resists wear\r\nAll seams are welded\r\nR-value equals 6.0; most sleeping pads REI sells range in R-value from 1.0 (minimally insulated) to 9.5 (highly insulated)\r\nIncludes a stuff sack', 16),
(20, 'High-grade, open-cell polyurethane foam delivers efficient warmth; horizontal air channels cored through foam add additional comfort\r\nLaminated polyester surface fabric is durable with velvety soft feel for next-to-skin comfort with a nonslip finish to keep you on the pad\r\nHigh-frequency welded seams resist humidity and create an airtight construction\r\nR-value of 9.5 provides 4-season comfort and warmth; most sleeping pads we sell range in R-value from 1.0 (minimally insulated) to 9.5 (highly insulated)\r\n2 wide, low-profile FlatValves feature a built-in flap to prevent air escaping when inflating; flap can be released to let a little air out for finding that ideal comfort zone\r\nPad self-inflates; to top off, inflate with included Exped Mini Pump\r\nIncludes stuff sack and repair kit with adhesive and fabric patches', 17),
(21, 'Patent-pending reflective layer returns heat back to your body and creates air pockets that conserve warmth, all without the bulk and weight of down and synthetic fills\r\nNew softer fabrics bring better next-to-skin comfort and boost durability with no added weight\r\nUltra-packable design offers less weight and bulk than a 1-liter water bottle\r\nAdvanced fabrics and a tapered design have an excellent warmth-to-weight ratio\r\n2.5-in. thickness, soft-touch fabrics and baffled internal structure provide unrivaled comfort, stability and support', 18),
(22, 'V-shape chambers limit air movement and heat loss; chambers also help the pad stay with your every move as you sleep\r\nSynthetic fibers add warmth, giving the pad an R-value of 4.4; most sleeping pads we sell range in R-value from 1.0 (minimally insulated) to 9.5 (well insulated)\r\nChambers evenly distribute the air for great comfort; inflated side rails help keep you on the pad\r\nStatic V pad can be inflated with just 10 - 15 breaths; easy-to-use push valve allows for quick deflation\r\nRolled up, Klymit Insulated Static V sleeping pad measures 5 x 9 in.\r\nConstructed from 75-denier polyester for durability\r\nPad includes a stuff sack and patch kit', 19),
(23, 'Top fabric is tough, lightweight ripstop fabric and the bottom is polyester taffeta\r\nPad will inflate and deflate quickly with the jet stream foam, and roll up compactly to fit into the stuff sack\r\nExtra-large size includes 2 valves for fast inflating\r\nStuff sack, compression straps and repair kit are included\r\nSpecial buy\r\nImported.\r\n* Intermediate markdowns may have been taken', 20),
(24, '3 in. thick warm-weather pad offers great comfort and packs down small\r\nLight, ripstop nylon construction with internal polyurethane coating creates a durable, airtight structure\r\n2-piece valve allows for easy inflation and quick deflation (pad does not self-inflate)\r\nR-value equals 1.5; most sleeping pads range in R-value from 1.0 (minimally insulated) to 9.5 (highly insulated)\r\nEach pad is individually inflated and tested at the factory\r\nCloseout\r\nImported.\r\n* Intermediate markdowns may have been taken.', 42),
(25, 'Set includes 4 polypropylene plates, 4 bowls, 4 insulated mugs with Sip-It lids, 2-liter pot with lid, 3-liter pot with lid, frypan, pot gripper and a welded sink/stuff sack\r\nAll items nest neatly within the 3-liter pot and stow in the welded sink/stuff sack for easy packing\r\nPinnacle-series hard-anodized aluminum pots and frypan distribute heat evenly for efficient cooking; Teflon® Radiance technology offers supreme scratch resistance\r\nTeflon Radiance features a specially formulated topcoat to enhance heat dispersion for quick heating; nonstick coating is tough enough to handle use with most metal utensils\r\nLightweight, BPA-free plastic pot lids feature integrated strainers ideal for use with pasta and steamed vegetables; flip-up tabs on top make for easy lid removal\r\nBPA-free Infinity plastic mugs nest securely inside Infinity bowls, which in turn nest within the 2-liter pot; 4 plates nest within the 3-liter pot\r\nColor-coded mugs, bowls and plates help you keep track of which set is yours\r\nInfinity polypropylene has a high melting temperature, offers good impact resistance, won\'t retain odors and is dishwasher safe\r\nEVA foam sleeves keep your beverages hot while the dual-port Sip-It tops help prevent spills; compact mug shape is comfortable for both left- and right-hand use\r\nIncluded folding pot gripper locks to and removes easily from exterior brackets on the pots and frypan; gripper design prevents scratching of the nonstick surfaces\r\nGSI Pinnacle Camper cookset includes a welded sink basin that doubles as a carry bag', 21),
(26, 'Kit includes a hard-anodized 1.8 liter pot with strainer lid, 2 insulated mugs with lids, 2 bowls, 2 telescoping foons, a welded sink and a stove bag\r\nMugs nest securely inside the bowls, which in turn nest within the pot; color-coded mugs and bowls prevent mix-ups\r\nInsulated mugs have a low center of gravity and include lids with Sip-It openings that virtually eliminate spills\r\nUltralight backpacking stove and 220g isobutane fuel canister (both sold separately) can also nest within for a complete and compact cooking system\r\nPinnacle-series aluminum pot distributes heat evenly for fast and efficient cooking and is extremely lightweight and abrasion resistant\r\nPinnacle-series cookware utilizes hard-anodized aluminum and Teflon® Radiance technology for supreme scratch and abrasion resistance\r\nTeflon Radiance technology features a specially formulated topcoat to enhance heat dispersion for quick and even heating\r\nNonstick coating is tough enough to handle use with most metal utensils\r\n2 telescoping foons give you the functionality of a fork and spoon, and they fit compactly inside the cook system\r\nBPA-free plastic lid is lightweight and features an integrated strainer ideal for use with pasta and steamed vegetables\r\nFlip-up tab on top of lid makes for easy lid removal\r\nCoated handle provides a comfortable, secure grip; handle locks into place for cooking and secures the entire set for transport\r\nMugs, bowls, foons and pot lid are made from BPA-free plastics that have high melting temperatures and are dishwasher safe; mugs and bowls are completely recyclable\r\nGSI Pinnacle Dualist Ultralight cookset includes a welded sink basin that doubles as a carry bag', 22),
(27, 'Set includes 4 polypropylene plates, 4 bowls, 4 insulated mugs, 4 Sip-It lids, a 2-liter pot with lid, a 3-liter pot with lid, a frypan, a pot gripper and a stuff sack\r\nBugaboo-series cookware features a durable and attractively painted finish that protects the aluminum core from abrasion and oxidation\r\nTeflon® Classic nonstick cooking surface on the pots and frypan speeds cleanup and resists scratches\r\nBPA-free plastic lids are lightweight and feature integrated strainers ideal for use with pasta and steamed vegetables; flip-up tabs on top of lids make for easy lid removal\r\nCascadian-series mugs nest securely inside bowls, which in turn nest within the 2-liter pot; 4 plates nest within the 3-liter pot\r\nColor-coded mugs, bowls and plates prevent mix-ups at the campsite\r\nMugs, bowls and plates are made from lightweight and flexible food-grade polypropylene plastic, making them easy to pack, stack and carry\r\nEVA foam sleeves on the mugs keep your beverages hot while the dual-port Sip-It tops help prevent spills\r\nCompact mug shape is comfortable for both left- and right-hand use\r\nFolding pot gripper locks to and removes easily from exterior brackets on pots and frypan; gripper design prevents scratching\r\nGSI Bugaboo Camper cookset includes a rugged stuff sack that doubles as a sink or wash basin', 23),
(28, 'Rustproof 18/8 stainless steel stands up to high temperatures and regular use; kettle can be placed directly over campfires and coals\r\nKettle is dishwasher safe and can be recycled at the end of its long life\r\nFolding handle locks into place upright, allowing the kettle be easily retrieved; notch in handle lets you hang the kettle over a fire\r\nStainless steel is BPA free\r\nGSI Glacier Stainless-Steel tea kettle comes with a lid', 43),
(29, 'Cast iron grill / griddle heats evenly and holds heat well, making it easy to cook your food to perfection\r\nDouble-sided grill / griddle combo lets you griddle breakfast, then flip it over and grill dinner\r\nPre-seasoned with the Camp Chef True Seasoned Finish, this grill / griddle has a natural cooking surface that is ready to use right out of the box\r\nTrue Seasoned Finish holds the heat and sears the meat to cook effectively\r\nCast iron grilling ridges allow you to grill like on a BBQ\r\nMolded-in handles for easy gripping\r\nFits all Camp Chef 14 in. and 16 in. stoves (sold separately)\r\n16 x 14 in. cooking surface for a cooking area of 224 sq. in.', 24),
(30, 'All pots, plus lid nest securely in the 3-liter pot for compact storage; storage sack included\r\nComes with all-purpose 1-, 2- and 3-liter pot sizes; lids perform double duty as dinner plates\r\nLightweight PanHandler™ securely lifts pots and lids, easily grasping and holding up to 10 lbs.\r\nScratch and dent resistant stainless steel stands up in the most rugged conditions\r\nRounded corners helps heat travel up sides of pot more quickly, boosting efficiency', 25),
(31, 'Features 2 burners that each kick out 20,000 BTUs to get your cooking done in short order; separate burner controls let you boil noodles and slowly warm sauce at the same time\r\nPiezo igniter sparks the stove to life with a push of the button, eliminating worries about wet matches and burning your hand\r\nLid and side shields block wind from the burners\r\nStainless-steel drip tray is easy to clean up\r\nConvenient carry handle makes it easy to transport the Camp Chef Everest 2-burner stove\r\nOperates on 16.4 oz. propane canisters, sold separately\r\nDue to flammable item shipping restrictions, we cannot sell fuel canisters online; they are available at REI retail stores', 26),
(32, 'The PocketRocket stove weighs just over 3 oz. and can boil a liter of water in less than 4 minutes\r\nStove is simple to operate, with no priming, preheating or pressurizing required; simply screw it onto the canister, turn it on, light and start cooking\r\nFully adjustable flame, from a rolling boil to a slow simmer; control valve is easy to operate even with gloved hands\r\nCompatible with most self-sealing canister fuel (Fuel canister not included and is not included in weight)\r\nMinimalist, nesting cookset includes a 2-liter hard-anodized pot, a strainer pot lid, 2 deep bowls, 2 insulated mugs, an integrated pot handle, and 2 folding sporks\r\nTwo 12.5 fl. oz. double-walled insulated polypropylene mugs keep your drinks hot and easy to handle; includes sip-through lids\r\nCookset nests within the 2-liter pot for easy packing', 27),
(33, 'Simple-to-operate design needs no priming, preheating or pressurizing; simply turn it on, light and start cooking\r\nFully-adjustable flame lets you cook gourmet meals from a rolling boil to a slow simmer; control valve turns easily, even when you\'re wearing gloves\r\nSerrated pot-supports prevent the pot from shifting; folds up compact for travel\r\nCompatible with most self-sealing canister fuel, making it a great choice for global travel\r\nIncludes a protective, custom-fit travel case\r\nFuel canister sold separately\r\nWeight includes stove, not the canister', 28),
(34, 'There\'s no need to buy or carry heavy fuel canisters with this stove—simply collect twigs during your journey and burn them when you get to camp\r\nUsing patent-pending thermoelectric technology, the stove converts heat to electricity that charges an internal battery and powers a fan to increase the efficiency of the fire\r\nExtra electricity can be used to charge small electronics like cell phones, headlamps and rechargeable batteries via the USB port; devices and charging cables sold separately\r\n20 min. of charging with a strong fire gives you about 1 hr. of talk time; charging times vary by device as well as by the strength of the fire\r\nDuring a full burn, the CampStove can boil 1 liter of water in as little as 4 min. 30 sec.; place your pot or pan on the built-in pot support\r\nUse the portable grill to turn your BioLite CampStove into a wood-burning grill that you can cook your favorite foods on\r\nSteel grill surface fits up to 4 hamburger patties or 6 hotdogs; high, medium and low temperature zones help you grill your foods to perfection\r\nStoke the fire in the CampStove by simply flipping open the fuel intake lid on the grill and adding more wood; fueling the fire won\'t interrupt your grilling\r\nCompact, portable design features folding legs and a durable plastic travel cover so you can take the grill anywhere\r\nStainless-steel KettlePot lets you make all your camp meals with a single piece of cookware, and it doubles as a carrying case to protect your CampStove\r\nThin, durable stainless-steel pot is lightweight and it won\'t scratch when you\'re using metal utensils\r\nHeat shield on the bottom protects the stove\'s flames from wind and concentrates them for fast cooking times\r\nBPA-free kettle lid can be used as a cover when you\'re cooking or you can snap it on tight to pour liquids safely and easily\r\nIncluded serving bowl nests neatly in the bottom of the KettlePot when not in use; silicone-coated foldout handles stay cool for easy handling\r\nIncluded portable and pliable USB FlexLight is a fast and easy way to provide functional task lighting; produces 100 lumens of light\r\nTurn the light on with the tap of a finger; touch and hold to dim easily to desired levels; works with any USB port, including those on the BioLite CampStove', 29),
(35, 'Just hit the InstaStart push-button ignition to get things going on this durable, steel-crafted outdoor appliance that offers camp cooks a grill and a stove at the same time\r\nPerfectFlow Pressure Control System keeps the heat steady on each of the 2 high-performance 11,000-BTU burners\r\nStove surface fits a 10-in. pan and the 130-sq.-in. grill area offers plenty of room\r\nOnce this propane camping stove starts to heat up, PerfectHeat Technology gets the temperatures just right\r\nWindBlock panels help shield your flame from wind, and on calm days, they fold down for use as side tables\r\nWhen the meal is over, the grates and grease management tray remove for simple and quick cleanup\r\n2 independently adjustable burners give you precise control for 2 temperature zones\r\nNonskid feet let you stir pots and pans with ease\r\nAluminized steel cooktop for durable rust resistance\r\n1-hr. runtime with both burners on high using a single 16.4-oz propane cylinder (sold separately)\r\nDue to flammable item shipping restrictions, we cannot sell fuel canisters online; they are available at REI retail stores', 30),
(36, 'The Sport\'s compound parabolic reflectors and tubular design convert nearly 80% of all sunlight entering the refectories into usable heat\r\nStove is so efficient that it works on partly cloudy and overcast days\r\nLoad food into the tube cooking chamber and set the camber on the reflector to cook\r\nCooks a meal in as little as 20 min., reaching temperatures up to 550°F (290°C)\r\nDeploys in seconds and collapses into a durable package; folding parabolic reflectors protect the cooking tube like a clamshell\r\nVacuum tube keeps exterior surface cool even while hot inside\r\nThe tubes are made of durable borosilicate glass (similar to Pyrex®)\r\nGoSun does not require frequent adjustment, making it a low-maintenance, fuel-free cooking device\r\nIncludes a tube cooking chamber, 2 foldable parabolic reflectors, a stainless-steel cooking tray, a rugged scrubby cleaning tool and an instruction manual', 44),
(37, 'Rotomolded polyethylene construction, the same process used to make whitewater kayaks, ensures excellent impact resistance and long-lasting durability\r\nExtra-thick walls contain proprietary PermaFrost™ insulation that is pressure injected, giving the cooler outstanding resistance to outside temperatures\r\nYETI coolers are designed to handle extremely low temperatures and are compatible with dry ice; dry ice provides about 3 times the cooling power of regular ice\r\nTundra 45 cooler has a 35.5-liter capacity that will hold 26 cans and plenty of ice; designed to accommodate long-neck bottles\r\nTundra lid seals shut with a freezer-quality gasket around the entire lid to minimize air exchange\r\nInteragency Grizzly Bear Committee has certified the Tundra 45 as a bear-resistant food container when used with 2 padlocks (sold separately) on both front corners\r\nTie-down slots are molded into the cooler body for solid mounting in your boat or truck; cooler can be secured while allowing access to the inside; straps sold separately\r\nFull-length, rustproof aluminum rod connects and holds the body and lid together; hinge stops are molded in the lid so the hinge will never break\r\nScrew-in gasketed drain plug won\'t leak; partially unscrew the plug to drain water\r\nHaul handles on the ends are designed to make carrying a loaded cooler easier for 2 people; textured grips are secured with marine-grade nylon rope\r\nUse the integrated recessed handles when you\'re carrying the cooler by yourself\r\nIncluded dry goods rack keeps your sandwiches from getting soggy\r\nNonmarking rubber feet on the bottom of the cooler keep it from sliding around the deck of your boat', 31),
(38, 'Rotomolded polyethylene construction, the same process used to make whitewater kayaks, ensures excellent impact resistance and long-lasting durability\r\nExtra-thick walls contain proprietary PermaFrost™ insulation that is pressure injected, giving the cooler outstanding resistance to outside temperatures\r\nYETI coolers are designed to handle extremely low temperatures and are compatible with dry ice; dry ice provides about 3 times the cooling power of regular ice\r\nIt\'ll hold whatever fish you\'re catching, and the non-slip feet and built-in tie-downs will keep it in place on your boat\r\nPlus you can use it as an extra bench for casting, reeling or lounging with a frosty beer\r\nNo Sweat design keeps it dry on the outside\r\nInteragency Grizzly Bear Committee has certified the Tundra 125 as a bear-resistant food container when used with 2 padlocks (sold separately) on both front corners\r\nDoubleHaul handles are made from military-grade nylon rope with a heavy-duty textured grip\r\nVortex drain system: a quick twist drains it all\r\nTundra 125 cooler has a 114.7-liter capacity that will hold 81 cans with a 2:1 ice-to-cans ratio; holds up to 129 lbs. of ice (ice only)\r\nYETI Tundra 125 Cooler measures 40 x 19.5 x 20 in. and weighs 48 lbs.', 32),
(39, 'Rugged, oversize wheels roll easily over all kinds of terrain\r\nSlide-and-lock horizontal handle technology enhances leverage and reduces the lifting load\r\nInsulated lid provides extended ice retention and maximum cooling performance\r\nCool Riser design keeps contents cool by elevating them away from hot surfaces\r\n4-day ice retention rating helps extend the camping trip or party\r\nBuilt-in bottle openers on each side of the cooler; butler tray for convenient preparation and serving; exterior storage pockets for stashing small items; 6 cup holders\r\nRemovable, water-resistant dry storage box helps protect electronics and other essentials and keep them from overheating; mobile device stand offers outdoor entertainment\r\nTie-down loops let you lash gear on the top for secure transport to your next destination', 33),
(40, 'This limited edition cooler is perfect for enjoying the majestic places that the National Park Service tirelessly protects\r\nWith its classic design first developed in 1954, this cooler lets you go back in time while keeping a touch of the modern for your cold food and drinks\r\nLarge enough to hold 85 cans and tall enough to hold 2-liter bottles upright, you\'ll have plenty of space for refreshments for a whole group of people\r\nComfort-grip steel handles and stainless steel lid latch make getting to your destination easy, comfortable and secure\r\nSupporting up to 250 lbs., the Have-A-Seat lid with built-in bottle opener ensures you always have a place to sit and relax while you enjoy the day with a cold drink in hand\r\nLeak-resistant channel drain makes it easy to empty any excess water without tilting the cooler, so you\'re ready for your next fun adventure\r\nStainless-steel finish lends an elegant touch to the iconic design\r\n4-day ice retention at temperatures up to 90—F\r\nLatch releases under 15 lbs. of pressure to help keep kids from getting stuck inside\r\nRust-resistant, stainless -steel hardware\r\nLow CO2 insulation ensures reduced carbon emissions in foam manufacturing\r\nOfficial cooler of the National Park Foundation', 34),
(41, 'Xtreme technology uses an insulated lid and extra insulation in the walls to keep your items cold for up to 6 days\r\nLarge enough to hold 204 cans, you\'ll have plenty of space for refreshments for the entire party\r\nHave-A-Seat Lid supports up to 250 lbs. for a place to sit and rest\r\nLeak-resistant channel drain for easy draining without tilting the cooler\r\nComfort-grip, no-crush handles for easy, pinch-free carrying\r\nCup holders molded into the lid keep drinks close at hand\r\nEZ-Clean top has a smoother surface than most coolers and wipes clean easily\r\nKeeps ice up to 6 days at temperatures up to 90°F\r\nLow CO2 insulation for reduced carbon emissions from foam manufacturing\r\nMade in the USA', 35),
(42, 'Dielectric, high-reflective, multilayer prism coating and fully multicoated lenses supply natural color reproduction, sharpness and excellent light transmission\r\nPhase-correction-coated roof prisms ensure high resolution; Eco-glass lenses and prisms are free of lead and arsenic\r\nErgonomically shaped, lightweight body features a rubber-armored exterior, providing added shock resistance and a firm grip whether wet or dry\r\nLarge, central focus wheel and adjustable diopter make focus easy to achieve and maintain, even while wearing gloves\r\nTurn-and-slide rubber eyecups and long eye relief allow easy, comfortable viewing when wearing glasses\r\nNikon Monarch 5 10 x 42 binoculars are O-ring sealed and nitrogen-purged for waterproof, fog-proof performance; they can be submerged to 1m of water for up to 10 min.', 36),
(43, 'These full-size binoculars offer a steady view, ideal for use on boats and for serious wildlife viewing\r\nWide field of view makes it easy to quickly scan large areas; great for bird watching\r\nLightweight body is made of durable fiberglass-reinforced polycarbonate resin\r\nShock-resistant rubber body armor offers a firm, comfortable grip\r\nLong eye relief design ensures a clear field of view, even for eyeglass wearers\r\nHighly reflective, silver alloy mirror coating gives you a bright and clear view\r\nMulti-click turn-and-slide eyecups\r\nEco-glass lenses and prisms are free of lead and arsenic', 37),
(44, 'Thanks to fully multicoated Eco-glass lenses and Phase-Correction Coated Roof Prisms, the Prostaff 7S delivers sharp images full of brightness and optical clarity\r\nMultilayer coatings, which provide higher light transmittance across the entire visible light spectrum, are applied to the lens and prism surfaces that transmit light\r\nCoatings minimize the loss of light due to reflection, thereby ensuring a natural, clear view\r\nLightweight, ergonomic body design makes the Prostaff 7S enjoyable to hold for long periods of time\r\nCentral focus knob is intuitive to operate and is very user-friendly\r\nBuilt to handle any environment, the Prostaff 7S has a rubber-armored coating to withstand extreme use and provide a nonslip grip, even in the wettest conditions\r\nTurn-and-slide rubber eyecups allow users to adjust the eye relief for a custom fit, providing a full field of view and maximum comfort during extended periods of use\r\nProstaff 7S binoculars are nitrogen-filled and O-ring-sealed for complete waterproof and fogproof performance', 38);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemid` int(10) UNSIGNED NOT NULL,
  `productname` varchar(100) NOT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(30) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `picturelink` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemid`, `productname`, `brand`, `price`, `category`, `color`, `picturelink`) VALUES
(1, 'REI Kingdom 6 Tent', NULL, '439.00', 'camping/tents', 'Willow/Alpaca', 'https://www.rei.com/media/product/894016?size=230'),
(2, 'Marmot Limestone 6P Tent', NULL, '449.00', 'camping/tents', 'Malaia Gold', 'https://www.rei.com/media/product/863989?size=230'),
(3, 'Big Agnes Copper Spur UL 2 mtnGLO Tent', NULL, '449.95', 'camping/tents', 'Silver/Gray', 'https://www.rei.com/media/product/880753?size=230'),
(4, 'Marmot Limelight 3P Tent with Footprint', NULL, '299.00', 'camping/tents', 'Cinder/Rusted Orange', 'https://www.rei.com/media/product/895812?size=230'),
(5, 'REI half Dome 2 Tent', NULL, '199.00', 'camping/tents', 'Lion', 'https://www.rei.com/media/product/878519?size=230'),
(6, 'The North Face Dolomite Double 20 Sleeping Bag', NULL, '159.00', 'camping/sleeping-bags', 'Blue/Grey', 'https://www.rei.com/media/product/895337?size=230'),
(7, 'REI Carina 32 Sleeping Bag', NULL, '139.00', 'camping/sleeping-bags', 'Sapphire Purple', 'https://www.rei.com/media/product/894950?size=500'),
(8, 'REI Radiant Sleeping Bag', NULL, '148.99', 'camping/sleeping-bags', 'Galaxy Blue/Squash', 'https://www.rei.com/media/product/862474?size=230'),
(9, 'The North Face Inferno -20 Sleeping Bag', NULL, '599.00', 'camping/sleeping-bags', 'Grey/Orange', 'https://www.rei.com/media/product/879823?size=230'),
(10, 'The North Face Dolomite 20 Sleeping Bag', NULL, '99.00', 'camping/sleeping-bags', 'Blue/Grey', 'https://www.rei.com/media/product/895333?size=230'),
(11, 'ENO DoubleNest Hammock', NULL, '69.95', 'camping/hammocks', 'Orange/Grey', 'https://www.rei.com/media/product/754773?size=230'),
(12, 'ENO OneLink Hammock Shelter System with DoubleNest Hammock', NULL, '219.95', 'camping/hammocks', 'Navy Blue', 'https://www.rei.com/media/product/830267?size=230'),
(13, 'ENO Guardian Bug Net', NULL, '59.95', 'camping/hammocks', 'Black', 'https://www.rei.com/media/product/754781?size=230'),
(14, 'Kammok Koala Hammock Underquilt', NULL, '329.00', 'camping/hammocks', 'Red/Grey', 'https://www.rei.com/media/product/101575?size=230'),
(15, 'ENO CamoLink Hammock Shelter System with Camo Hammock Tent', NULL, '254.95', 'camping/hammocks', 'Forest Camo', 'https://www.rei.com/media/product/895882?size=230'),
(16, 'REI Camp Bed 3.5 Self-Inflating Sleeping Pad', NULL, '119.00', 'camping/pads', 'Eclipse Blue', 'https://www.rei.com/media/product/870757?size=230'),
(17, 'Exped SIM MegaMat Duo Sleeping Pad', NULL, '349.00', 'camping/pads', 'Ruby Red', 'https://www.rei.com/media/product/881907?size=230'),
(18, 'Therm-a-Rest NeoAir XLite Sleeping Pad', NULL, '129.95', 'camping/pads', 'Marigold', 'https://www.rei.com/media/product/881574?size=230'),
(19, 'Klymit Insulated Static V Sleeping Pad', NULL, '84.95', 'camping/pads', 'Orange/Grey', 'https://www.rei.com/media/product/866835?size=230'),
(20, 'ALPS Mountaineering Lightweight Air Pad', NULL, '89.95', 'camping/pads', 'Blue', 'https://www.rei.com/media/product/897538?size=230'),
(21, 'GSI Outdoors Pinnacle Camper Cookset', NULL, '139.95', 'camping/cook-wares', 'Black', 'https://www.rei.com/media/product/830776?size=230'),
(22, 'GSI Outdoors Pinnacle Dualist Ultralight Cookset', NULL, '64.95', 'camping/cook-wares', 'Black', 'https://www.rei.com/media/product/830774?size=230'),
(23, 'GSI Outdoors Bugaboo Camper Cookset', NULL, '109.95', 'camping/cook-wares', 'Black', 'https://www.rei.com/media/product/830828?size=230'),
(24, 'Camp Chef Reversible Cast Iron Grill/ Griddle', NULL, '54.95', 'camping/cook-wares', 'Black', 'https://www.rei.com/media/product/897174?size=230'),
(25, 'MSR Alpine 4 Pot Set', NULL, '79.95', 'camping/cook-wares', 'Black', 'https://www.rei.com/media/product/401120?size=230'),
(26, 'Camp Chef Everest 2- Burner Camp Stove', NULL, '109.95', 'camping/stoves', 'Red', 'https://www.rei.com/media/product/824171?size=230'),
(27, 'MSR PocketRocket Stove Kit', NULL, '99.95', 'camping/stoves', 'Black', 'https://www.rei.com/media/product/106902?size=230'),
(28, 'MSR PocketRocket Backpacking Stove', NULL, '29.99', 'camping/stoves', 'Black', 'https://www.rei.com/media/product/660163?size=230'),
(29, 'BioLite Wood Burning CampStove Bundle', NULL, '199.95', 'camping/stoves', 'Black', 'https://www.rei.com/media/product/897128?size=230'),
(30, 'Coleman Signature Grill Stove', NULL, '119.95', 'camping/stoves', 'Black', 'https://www.rei.com/media/product/883482?size=230'),
(31, 'YETI Tundra 45 Cooler', NULL, '350.00', 'camping/coolers', 'Tan', 'https://www.rei.com/media/product/874210?size=230'),
(32, 'YETI Tundra 125 Cooler', NULL, '550.00', 'camping/coolers', 'White', 'https://www.rei.com/media/product/899053?size=230'),
(33, 'Igloo Trailmate Journey Cooler - 70 Qt.', NULL, '269.95', 'camping/coolers', 'Yellow/Gray', 'https://www.rei.com/media/product/112628?size=230'),
(34, 'Coleman National Parks Edition Steel-Belted Cooler - 54 Quarts', NULL, '199.95', 'camping/coolers', 'Grey/Chrome', 'https://www.rei.com/media/product/101578?size=230'),
(35, 'Coleman Xtreme 5 Cooler - 120 Qt.', NULL, '99.95', 'camping/coolers', 'Grey/Orange', 'https://www.rei.com/media/product/100317?size=230'),
(36, 'Nikon Monarch 5 10 x 42 Waterproof Binoculars', NULL, '365.00', 'accessories/binoculars', 'Black', 'https://www.rei.com/media/product/853971?size=230'),
(37, 'Nikon Prostaff 3S 10 x 42 Binoculars', NULL, '139.00', 'accessories/binoculars', 'Black', 'https://www.rei.com/media/product/107212?size=230'),
(38, 'Nikon Prostaff 7S 8 x 30 Waterproof Binoculars', NULL, '200.00', 'accessories/binoculars', 'Black', 'https://www.rei.com/media/product/890909?size=230'),
(39, 'REI Base Camp 6 Tent', NULL, '429.00', 'camping/tents', 'Sage/Mesa Orange', 'https://www.rei.com/media/product/862430?size=230'),
(40, 'REI Joule Sleeping Bag - Women\'s', NULL, '238.93', 'camping/sleeping-bags', 'Grey Mist', 'https://www.rei.com/media/product/862533?size=230'),
(41, 'ENO Blaze Hammock Underquilt', NULL, '299.95', 'camping/hammocks', 'Black', 'https://www.rei.com/media/product/848836?size=230'),
(42, 'Big Agnes Stillwater Sleeping Pad - Long Wide', NULL, '94.73', 'camping/pads', 'Gold/Gray', 'https://www.rei.com/media/product/899023?size=230'),
(43, 'GSI Outdoors Glacier Stainless-Steel Tea Kettle', NULL, '24.95', 'camping/cook-wares', NULL, 'https://www.rei.com/media/product/815536?size=230'),
(44, 'GoSun Sport Solar Camp Stove', NULL, '279.00', 'camping/stoves', NULL, 'https://www.rei.com/media/product/100561?size=230');

-- --------------------------------------------------------

--
-- Table structure for table `saveforlater`
--

CREATE TABLE `saveforlater` (
  `userid` int(10) UNSIGNED NOT NULL,
  `itemid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `userid3` int(10) UNSIGNED NOT NULL,
  `itemid3` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactionhas`
--

CREATE TABLE `transactionhas` (
  `transactionid` int(11) UNSIGNED NOT NULL,
  `datetimecreate` timestamp NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `itemid` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactionhistory`
--

CREATE TABLE `transactionhistory` (
  `datetimecreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zipCode` varchar(5) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `shippingMethod` varchar(50) NOT NULL,
  `cardType` varchar(15) NOT NULL,
  `cardNumber` varchar(16) NOT NULL,
  `CVC` varchar(3) NOT NULL,
  `cardMonth` varchar(2) NOT NULL,
  `cardYear` varchar(4) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(10) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `middleName` varchar(15) DEFAULT NULL,
  `lastName` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `itemid1` (`itemid`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `saveforlater`
--
ALTER TABLE `saveforlater`
  ADD PRIMARY KEY (`userid`,`itemid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `itemid` (`itemid`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`userid3`,`itemid3`),
  ADD KEY `userid3` (`userid3`),
  ADD KEY `itemid3` (`itemid3`);

--
-- Indexes for table `transactionhas`
--
ALTER TABLE `transactionhas`
  ADD PRIMARY KEY (`transactionid`),
  ADD KEY `datetime2` (`datetimecreate`),
  ADD KEY `itemid2` (`userid`);

--
-- Indexes for table `transactionhistory`
--
ALTER TABLE `transactionhistory`
  ADD PRIMARY KEY (`datetimecreate`) USING HASH,
  ADD KEY `userid1` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `detailid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `transactionhas`
--
ALTER TABLE `transactionhas`
  MODIFY `transactionid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saveforlater`
--
ALTER TABLE `saveforlater`
  ADD CONSTRAINT `saveforlater_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `saveforlater_ibfk_2` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`);

--
-- Constraints for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`userid3`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`itemid3`) REFERENCES `item` (`itemid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transactionhas`
--
ALTER TABLE `transactionhas`
  ADD CONSTRAINT `transactionhas_ibfk_1` FOREIGN KEY (`datetimecreate`) REFERENCES `transactionhistory` (`datetimecreate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionhas_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactionhistory`
--
ALTER TABLE `transactionhistory`
  ADD CONSTRAINT `transactionhistory_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
