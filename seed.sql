-- Kali subscriptions seeds
INSERT INTO kali_subscriptions (
        id,
        subscription_name,
        daily_points_limit
    )
VALUES (1, 'Free', 10000),
    (2, 'Paid', 20000),
    (3, 'Premium', 0);
    
-- Kali levels seeds
INSERT INTO kali_levels (
        level_name,
        image_url,
        motivational_quote,
        reward,
        step_count_to_next_level
    )
VALUES (
        'First Steps with Kali!',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F01.svg?alt=media&token=6c7b6510-a791-43c4-8d2a-50866f084eb7',
        'Walking is the perfect way of moving if you want to see into the life of things. It is the one way of freedom. - Elizabeth von Arnim',
        100,
        20000
    ),
    (
        'Traipsing Around',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F02.svg?alt=media&token=70a206c9-6844-41ca-9e8b-5e8b59b6d426',
        'The habit of saving is itself an education; it fosters every virtue, teaches self-denial, cultivates the sense of order, trains to forethought, and so broadens the mind. - T.T. Munger',
        100,
        30000
    ),
    (
        'New Kid on the Walk',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F03.svg?alt=media&token=202543bb-51f3-45b7-b66c-150c08ccac9c',
        'Staying healthy is not just about what you eat or how much you exercise, it''s also about your mindset and how you take care of yourself. - Unknown',
        100,
        40000
    ),
    (
        'Practicing Pedestrian',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F04.svg?alt=media&token=294e228d-dd40-4cc0-ac9b-fd74a5630ad8',
        'All truly great thoughts are conceived while walking. - Unknown',
        100,
        50000
    ),
    (
        'Trudging Along',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F05.svg?alt=media&token=33a11f21-f91e-40d7-bdea-ddd621cc33fc',
        'Meditation is a great way to reduce stress and improve your mental clarity. - Unknown',
        1000,
        60000
    ),
    (
        'Aspiring Ambler',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F06.svg?alt=media&token=db29e350-43d5-4131-b8d6-498f55976bc7',
        'Be grateful for what you have. Gratitude is good for your soul. - Unknown',
        100,
        70000
    ),
    (
        'Walking the Walk',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F07.svg?alt=media&token=48e43002-4f4d-4d4d-a1de-0f9734b878ad',
        'Health is a journey, not a destination. - Unknown',
        100,
        80000
    ),
    (
        'Aspiring Stroller',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F08.svg?alt=media&token=da342820-4c92-4670-bce6-9aac4d314859',
        'Push yourself because no one else is going to do it for you. -Unknown',
        100,
        90000
    ),
    (
        'Been Around the Block',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F09.svg?alt=media&token=71d7d9c2-d49e-44bd-96eb-c3a422cbd760',
        'The best way to predict the future is to create it. - Abraham Lincoln',
        100,
        100000
    ),
    (
        'Pathfinder',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F10.svg?alt=media&token=9465486b-32d2-451c-b85d-e13b1f85b1e4',
        'To give anything less than your best is to sacrifice the gift. - Steve Prefontaine',
        1000,
        110000
    ),
    (
        'Adventurer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F11.svg?alt=media&token=800aa041-3a81-423b-96e5-597267a20814',
        'The only way to do it is to do it. - Nike',
        100,
        120000
    ),
    (
        'Light Walker',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F12.svg?alt=media&token=550358ca-758f-4f9e-8ff2-1651526bd01a',
        'Stress is a major factor in many health problems. Find ways to manage stress in your life. - Unknown',
        100,
        130000
    ),
    (
        'Stepping Around Town',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F13.svg?alt=media&token=64e4c052-52f9-495c-ab80-0602eb90d436',
        'The doctor of the future will give no medicine, but will interest her or his patients in the care of the human frame, in a proper diet, and in the cause and prevention of disease. - Thomas Edison',
        100,
        140000
    ),
    (
        'Jolly Jaunter',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F14.svg?alt=media&token=12f64536-7642-40b5-98ee-4930c33c4cfe',
        'It''s not your salary that makes you rich, it''s your spending habits. - Charles A. Jaffe',
        100,
        150000
    ),
    (
        'Pacing Enthusiast',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F15.svg?alt=media&token=8e4371bc-ff54-4aeb-8ca8-d0345f7702d4',
        'The greatest pleasure in life is doing what people say you cannot do. - Walter Bagehot',
        1000,
        160000
    ),
    (
        'Top Notch Stroller',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F16.svg?alt=media&token=ebfc8954-90b0-4bd0-b890-c7c30353e912',
        'Your health is an investment, not an expense. - Unknown',
        100,
        170000
    ),
    (
        'Solid Saunterer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F17.svg?alt=media&token=60fb4530-359a-44ce-84cd-b497d0f3aabc',
        'Your health is your wealth, take care of it. - Unknown',
        100,
        180000
    ),
    (
        'Promenading',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F18.svg?alt=media&token=c084c46a-52b7-4236-baf8-f3ba649d58a1',
        'Good health is not something we can buy. However, it can be an extremely valuable savings account. - Anne Wilson Schaef',
        100,
        190000
    ),
    (
        'Treading Sidewalk',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F19.svg?alt=media&token=ebb03734-6c93-4347-a4e4-64b13c84a3d1',
        'Your body is your temple. Take care of it. - Unknown',
        100,
        200000
    ),
    (
        'Making Strides',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F20.svg?alt=media&token=03558346-ac01-43a8-a075-8b2401935ae5',
        'A budget tells us what we can''t afford, but it doesn''t keep us from buying it. - William Feather',
        2500,
        210000
    ),
    (
        'Wanderer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F21.svg?alt=media&token=eb0c0ec2-be66-43cf-8e68-70e508ca828f',
        'There is no such thing as too slow. You''re still lapping everyone on the couch. - Unknown',
        250,
        220000
    ),
    (
        'Step Up Your Game',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F22.svg?alt=media&token=ae7314ee-ff3d-4931-b62c-a296c8ff16e1',
        'Walking is the natural exercise that brings together the body and the mind. - Joseph Pilates',
        250,
        230000
    ),
    (
        'Hoofing It',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F23.svg?alt=media&token=23cb2303-3afa-4ef9-8589-cf4fdb9b667b',
        'Health is a choice, make the right one. - Unknown',
        250,
        240000
    ),
    (
        'High Pace Patrol',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F24.svg?alt=media&token=b124ccff-b312-41d3-aceb-bcb54a24663c',
        'A healthy outside starts from the inside. - Robert Urich',
        250,
        250000
    ),
    (
        'Kali Power Walker',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F25.svg?alt=media&token=8dd42ea5-784f-49cb-ae79-3fd88570cd67',
        'Follow your dreams. Don''t let anyone tell you what you can''t do. - Unknown',
        2500,
        260000
    ),
    (
        'Heel-and-Toe Racer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F26.svg?alt=media&token=01705375-06c9-4bbd-9634-4d428fa333f9',
        'The more you move, the more you groove. Exercise is not just about physical fitness, it''s about mental and emotional wellbeing too. - Karen Salmansohn',
        250,
        270000
    ),
    (
        'Speed Stepper',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F27.svg?alt=media&token=8f552c5c-6e61-4e79-88c4-f92ffe2dd945',
        'Health is a precious gift. Do not throw it away. - Dalai Lama',
        250,
        280000
    ),
    (
        'Footing It',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F28.svg?alt=media&token=3066839e-963f-432e-9c8f-875d0f308208',
        'Live in the present moment. Don''t dwell on the past or worry about the future. - Unknown',
        250,
        290000
    ),
    (
        'Striding Out',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F29.svg?alt=media&token=134373dc-e704-40de-9f89-113ff9af0625',
        'Water is essential for life. Drink plenty of it. - Unknown',
        250,
        300000
    ),
    (
        'Happy Hiker',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F30.svg?alt=media&token=338e0c8f-e04c-408b-8e6b-1cabbb82a40a',
        'Money saved is money earned. - Unknown',
        2500,
        310000
    ),
    (
        'Rambling On',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F31.svg?alt=media&token=a922433e-2780-41b6-a373-adb19f1ea956',
        'The miracle isn''t that I finished. The miracle is that I had the courage to start. - John Bingham',
        250,
        320000
    ),
    (
        'Roaming Around',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F32.svg?alt=media&token=a0ec7259-c54e-4817-be70-ca7a50959da4',
        'Exercise is not only good for your body, but it''s also good for your mind. - Unknown',
        250,
        330000
    ),
    (
        'Sauntering On',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F33.svg?alt=media&token=25948255-3137-4378-8038-76221032976f',
        'When you exercise regularly, you release endorphins that make you feel happy and energized. - Gretchen Reynolds',
        250,
        340000
    ),
    (
        'Marching Forward',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F34.svg?alt=media&token=be040907-785e-4b78-9660-efb1b541f8bd',
        'It''s not about the discount. It''s about the discipline. - Unknown',
        250,
        350000
    ),
    (
        'Step by Step',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F35.svg?alt=media&token=5c0daba6-c205-4b11-bb35-7d984edc5414',
        'A healthy body is a platform for flourishing a healthy mind and spirit. - Dr. Andrew Weil',
        2500,
        360000
    ),
    (
        'Walking Wonders',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F36.svg?alt=media&token=1e77d5b6-05ee-4dae-b15f-72ec26f1f899',
        'Take care of your body. It''s the only place you have to live. - Jim Rohn',
        250,
        370000
    ),
    (
        'Ambling Adventurer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F37.svg?alt=media&token=6fd0a16c-a658-4bd5-89d1-5110dc2805df',
        'Healthy habits are learned in the same way as unhealthy ones - through practice. - Wayne Dyer',
        250,
        380000
    ),
    (
        'Strollin'' and Rollin''',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F38.svg?alt=media&token=c091702a-c273-44c2-af6f-91aca4be86a7',
        'It''s not how much money you make, but how much money you keep, how hard it works for you, and how many generations you keep it for. - Robert Kiyosaki',
        250,
        390000
    ),
    (
        'Quick Steps',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F39.svg?alt=media&token=91c3990c-9344-4a04-a78f-76c3bae5592f',
        'If you can dream it, you can do it. - Walt Disney',
        250,
        400000
    ),
    (
        'Gaiting Great',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F40.svg?alt=media&token=6c004b33-cc70-445f-9c13-6be8620cfc83',
        'The best investment you can make in your future is your health. - Jim Rohn',
        2500,
        410000
    ),
    (
        'Stomping Strong',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F41.svg?alt=media&token=a6964497-9b7b-4b68-8e7f-f7ab488be9fc',
        'Run like there''s a hot guy in front of you and a creepy guy behind you. - Unknown',
        250,
        420000
    ),
    (
        'Trekking Along',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F42.svg?alt=media&token=98e50528-0ab7-456c-b620-34b569b8966f',
        'The art is not in making money, but in keeping it. - Proverb',
        250,
        430000
    ),
    (
        'Walkin'' and Talkin''',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F43.svg?alt=media&token=c8eea4c9-8f12-4040-b71e-4b3344c725eb',
        'Give back to your community. Helping others is good for your soul. - Unknown',
        250,
        440000
    ),
    (
        'Wanderlust',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F44.svg?alt=media&token=c965b08a-1f12-4cd2-890b-821612d52f1c',
        'Exercise not only changes your body, it changes your mind, your attitude, and your mood. - Unknown',
        250,
        450000
    ),
    (
        'Going the Distance',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F45.svg?alt=media&token=ea3cbc84-d60c-4100-adab-244b6154fac0',
        'Social connection is important for your health. Spend time with loved ones. - Unknown',
        2500,
        460000
    ),
    (
        'A Step Ahead',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F46.svg?alt=media&token=fb24cac1-38a6-4c1a-8875-08c3f66afcc6',
        'Sweat, smile, and repeat. The formula for happiness and a healthy body. - Casey Ho',
        250,
        470000
    ),
    (
        'Globetrotter',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F47.svg?alt=media&token=2643963e-50eb-4735-91e5-7db0186c2d08',
        'Saving money is a good thing. And so is saving time. - Joel Edgerton',
        250,
        480000
    ),
    (
        'Walking on Sunshine',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F48.svg?alt=media&token=1f7a5496-0545-4858-b7d5-72c4810acf0e',
        'It''s not about being the best. It''s about being better than you were yesterday. - Unknown',
        250,
        490000
    ),
    (
        'Walking Encyclopedia',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F49.svg?alt=media&token=969d96d0-520b-476c-8201-782c6f813f30',
        'Walking is the ultimate adventure, the first meditation, a practice of heartiness and soul primary to humankind. - Gary Snyder',
        250,
        500000
    ),
    (
        'Kali Expeditioner! ',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F50.svg?alt=media&token=b5c06ca5-8179-4e8c-bbdb-e7d4b883cf67',
        'To ensure good health: eat lightly, breathe deeply, live moderately, cultivate cheerfulness, and maintain an interest in life. - Dalai Lama',
        4000,
        510000
    ),
    (
        'Strut Your Stuff',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F51.svg?alt=media&token=7ddda1af-191d-4e8a-bd4d-7809336427c6',
        'A healthy mind lives in a healthy body. - Cicero',
        400,
        520000
    ),
    (
        'Walking Wonder',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F52.svg?alt=media&token=424f8d40-7874-429e-8867-8cd981f1e9ec',
        'Investing in your health today will pay dividends tomorrow. - Unknown',
        400,
        530000
    ),
    (
        'Happy-Go-Lucky Hiker',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F53.svg?alt=media&token=f043b956-2481-4051-836b-6c3bcd2e89cc',
        'The secret of success is to do the common things uncommonly well. - John D. Rockefeller',
        400,
        540000
    ),
    (
        'Footloose and Fancy Free',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F54.svg?alt=media&token=d5d95351-9f5c-496c-92c5-ce93b3b84bc6',
        'Health is wealth. - Benjamin Franklin',
        400,
        550000
    ),
    (
        'Tiptoeing Through Life',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F55.svg?alt=media&token=e96a84ea-6a93-4b85-84fa-f1d8969c1133img',
        'The best way to start your day is with a healthy breakfast. - Unknown',
        4000,
        560000
    ),
    (
        'Boldly Striding Forward',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F56.svg?alt=media&token=c7cdd342-f8f1-4fa7-88a8-1ac032a56d2d',
        'The only bad run is the one that didn''t happen. - Unknown',
        400,
        570000
    ),
    (
        'Moseying Onward',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F57.svg?alt=media&token=717e2913-471a-4398-800f-a2278b96e60e',
        'Happiness is nothing more than good health and a bad memory. - Albert Schweitzer',
        400,
        580000
    ),
    (
        'Stepping into the Future',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F58.svg?alt=media&token=8d834789-7b55-494f-91e9-450510592ba7',
        'You are capable of great things. Believe in yourself and never give up. - Unknown',
        400,
        590000
    ),
    (
        'Taking Steps in the Right Direction',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F59.svg?alt=media&token=c7ac3000-8c82-4f63-8498-bbe7398fed55',
        'Walking is the great adventure, the first meditation, a practice of heartiness and soul primary to humankind. - Gary Snyder',
        400,
        600000
    ),
    (
        'Sauntering Serendipity',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F60.svg?alt=media&token=6dc63554-3924-459c-b98a-9537dd2c2ca0',
        'Healthy living is a lifelong journey, not a destination. - Unknown',
        4000,
        610000
    ),
    (
        'Marching to Your Own Beat',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F61.svg?alt=media&token=3bafe237-91cc-4ce6-9b38-eb1c550380b0',
        'Motivation is what gets you started. Habit is what keeps you going. -Unknown',
        400,
        620000
    ),
    (
        'Ramble On, My Friend',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F62.svg?alt=media&token=9763eadd-e51d-429f-ada8-a3143510940b',
        'Running is a gift you give yourself. - Unknown',
        400,
        630000
    ),
    (
        'Trekking Tall',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F63.svg?alt=media&token=2580d11c-310c-4bbf-be80-93e5e36f2f67',
        'What seems impossible today will one day become your warm-up. -Unknown',
        400,
        640000
    ),
    (
        'Walk with Purpose',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F64.svg?alt=media&token=1c5d23bf-ab6f-4074-9bce-f0debacc1ef0',
        'The human body has been designed to resist an infinite number of changes and attacks brought about by its environment. To keep the body in good health is a duty…otherwise we shall not be able to keep the mind strong and clear. - Buddha',
        400,
        650000
    ),
    (
        'Striding Specialist',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F65.svg?alt=media&token=5171f2ed-4c83-4cd3-88b5-6e3af7e6467e',
        'When in doubt, run it out. - Unknown',
        4000,
        660000
    ),
    (
        'Hiking Hotshot',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F66.svg?alt=media&token=f2d56f85-3db5-451d-8177-dffee67ac72c',
        'Money is only a tool. It will take you wherever you wish, but it will not replace you as the driver. - Ayn Rand',
        400,
        670000
    ),
    (
        'Racewalking Rocket',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F67.svg?alt=media&token=a0c62f50-72af-4c05-b165-813df2676e2a',
        'Running allows me to set my mind free. Nothing seems impossible. Nothing unattainable. - Kara Goucher',
        400,
        680000
    ),
    (
        'Brisk Strider',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F68.svg?alt=media&token=268c1485-a18a-4584-b41c-42750004dec0',
        'Wellness is a process, not a product. - Unknown',
        400,
        690000
    ),
    (
        'Rambling Rambler',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F69.svg?alt=media&token=1f95c899-d863-4d5f-b495-62117cbfd343',
        'Health is the greatest wealth. - Aesop',
        400,
        700000
    ),
    (
        'Steady Stepper',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F70.svg?alt=media&token=748c2512-9d93-4ecc-90ac-b407effb6f7e',
        'Health is a state of complete harmony of the body, mind and spirit. - Dalai Lama',
        4000,
        710000
    ),
    (
        'Walk-athon Wonder',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F71.svg?alt=media&token=5592093e-425b-454f-bebd-a8bcc7fd2147',
        'Never give up. No matter what life throws your way, never give up on your dreams. - Unknown',
        400,
        720000
    ),
    (
        'Hurdling Hiker',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F72.svg?alt=media&token=6b0df85a-1068-416c-be34-a11418939ec2',
        'Walking is a man''s best medicine. - Hippocrates',
        400,
        730000
    ),
    (
        'Marathon Mover',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F73.svg?alt=media&token=6c6c70c0-07db-4324-addb-e1ef83b86a52',
        'The body achieves what the mind believes. - Unknown',
        400,
        740000
    ),
    (
        'Sprinting Strider',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F74.svg?alt=media&token=c7f7fdbc-e160-4662-9345-e40277585f0d',
        'The greatest wealth is health. - Virgil',
        400,
        750000
    ),
    (
        'Kali Trailblazer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F75.svg?alt=media&token=a58551c3-40e0-43d0-a449-f39fd948f0e6',
        'The quickest way to double your money is to fold it in half and put it in your back pocket. - Will Rogers',
        6000,
        760000
    ),
    (
        'Quickstep Queen/King',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F76.svg?alt=media&token=2b4b7b44-efea-4982-a7a1-de44123be402',
        'An early morning walk is a blessing for the whole day. - Henry David Thoreau',
        600,
        770000
    ),
    (
        'Moseying Marvel',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F77.svg?alt=media&token=fd04ec8e-be23-4911-a0fd-17886390942a',
        'The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt',
        600,
        780000
    ),
    (
        'Power Pacer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F78.svg?alt=media&token=5844c537-87b9-490d-b6cc-c18d7c587132',
        'Success is not final, failure is not fatal: it is the courage to continue that counts. - Winston Churchill',
        600,
        790000
    ),
    (
        'Running Rascal',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F79.svg?alt=media&token=3997b5b7-9cf5-43ba-a597-8c877d298112',
        'Walking is the simplest, most natural way to improve your health and well-being. - Dr. Andrew Weil',
        600,
        800000
    ),
    (
        'Speedy Strider',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F80.svg?alt=media&token=aefc392e-6a80-40fa-9d9b-14b8b4aa61ee',
        'Laughter is the best medicine. Find ways to laugh more in your life. - Unknown',
        6000,
        810000
    ),
    (
        'Trekking Titan',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F81.svg?alt=media&token=c81d4c91-49fc-4d4c-8c29-7450a91ff2dd',
        'Never spend your money before you have it. - Thomas Jefferson',
        600,
        820000
    ),
    (
        'Marching Maverick',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F82.svg?alt=media&token=5d301648-ec9a-408b-9a72-dd01e847ea33',
        'Run often. Run long. But never outrun your joy of running. - Julie Isphording',
        600,
        830000
    ),
    (
        'Stair Stepper',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F83.svg?alt=media&token=069e0492-aa01-4742-ba59-8abcdc8a260d',
        'Get enough sleep. Your body needs time to rest and repair itself. - Unknown',
        600,
        840000
    ),
    (
        'Sprinting Superstar',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F84.svg?alt=media&token=19d93d44-8e0e-4a3d-b890-e5d493ce0363',
        'The difference between try and triumph is just a little umph! - Marvin Phillips',
        600,
        850000
    ),
    (
        'Fast Feet Fiend',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F85.svg?alt=media&token=b5c1bb4f-62fd-4f99-98b9-3c1802f42949',
        'Running is the greatest metaphor for life, because you get out of it what you put into it. - Oprah Winfrey',
        6000,
        860000
    ),
    (
        'Walk Warrior',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F86.svg?alt=media&token=dc88f071-8f83-4d72-9bda-3734e3aa9e12',
        'The world is a beautiful place. Take time to appreciate it. - Unknown',
        600,
        870000
    ),
    (
        'Racing Runner',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F87.svg?alt=media&token=bfae9afd-a93d-4221-84ad-9e93edbcc23b',
        'Frugality includes all the other virtues. - Cicero',
        600,
        880000
    ),
    (
        'Pathfinding Pioneer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F88.svg?alt=media&token=5441d742-f484-4cf0-ab03-25924dcb2a2a',
        'Healthy citizens are the greatest asset any country can have. - Winston Churchill',
        600,
        890000
    ),
    (
        'Adventure Ambassador',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F89.svg?alt=media&token=5433bc13-56b9-45ea-966e-22473319b046',
        'Walking is the best possible exercise. Habituate yourself to walk very fast. - Thomas Jefferson',
        600,
        900000
    ),
    (
        'Jogging Jester',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F90.svg?alt=media&token=44ed7eb6-16c0-40da-9b10-dd9fbd9b9e2d',
        'The only way to do great work is to love what you do. - Steve Jobs',
        6000,
        910000
    ),
    (
        'Striding Sage',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F91.svg?alt=media&token=28b733fb-8d00-4670-b7d9-a2002c06799c',
        'The journey of a thousand miles begins with a single step. - Lao Tzu',
        600,
        920000
    ),
    (
        'Hiking Hero',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F92.svg?alt=media&token=34c83044-6e6f-4ab8-be17-5f43ef7e657f',
        'Invest in your health, it’s the best investment you’ll ever make. - Unknown',
        600,
        930000
    ),
    (
        'Tiptoeing Titan',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F93.svg?alt=media&token=a5cd389d-600c-411a-b837-ea295ec68884',
        'The best medicine is prevention. - Hippocrates',
        600,
        940000
    ),
    (
        'Endurance Engineer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F94.svg?alt=media&token=5f8847f2-089b-410b-98a2-b5b6434f2376',
        'When diet is wrong, medicine is of no use. When diet is correct, medicine is of no need. - Ayurvedic proverb',
        600,
        950000
    ),
    (
        'Galloping Guru',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F95.svg?alt=media&token=0250198e-b4d1-4239-88cc-2cc38195c36f',
        'Walking is the most ancient exercise and still the best modern exercise. - Carrie Latet',
        6000,
        960000
    ),
    (
        'Stepping Superhero',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F96.svg?alt=media&token=a8d5e92f-cb45-4cfb-9328-3e6bacc06c74',
        'The obsession with running is really an obsession with the potential for more and more life. - George Sheehan',
        600,
        970000
    ),
    (
        'Footloose Fanatic',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F97.svg?alt=media&token=137de1d7-1f9b-4f24-84e1-8ad2f66e0b2a',
        'A penny saved is a penny earned. - Benjamin Franklin',
        600,
        980000
    ),
    (
        'Speedy Explorer',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F98.svg?alt=media&token=172338c5-4fd3-47a5-9961-a0ae23005e2b',
        'You are one workout away from a better mood. -Unknown',
        600,
        990000
    ),
    (
        'Sauntering Sensation',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F99.svg?alt=media&token=31fda9d0-8ec2-4334-8b10-71af71654ca2',
        'You must gain control over your money or the lack of it will forever control you. - Dave Ramsey',
        600,
        1000000
    ),
    (
        'Kali Superstar!',
        'https://firebasestorage.googleapis.com/v0/b/kali-f3ff6.appspot.com/o/levels%2F100.svg?alt=media&token=5cc61836-52b9-4ef0-81ec-5c7a72c1a0a9',
        'Physical fitness is the first requisite of happiness. - Joseph Pilates',
        10000,
        1100000
    );