questions = [
  {body: "What is your favorite spot for hiking in the north of Portugal?"},
  {body: "Where did you travel last time? How was it?"},
  {body: "How often do you go to music concerts? Which one was your favorite?"},
  {body: "What sports do you do and how often? "},
  {body: "How do you prefer to relax? "},
  {body: "What is your traveling dream destination and why?"},
  {body: "Do you have pets? Share with everyone the most special facts about them."},
  {body: "Perfect breakfast: what is it for you?"},
  {body: "A must-see movie to lift one's spirits. Why does it inspire you?"},
  {body: "Are you more of an introvert or an extrovert? Where and how do you meet new people?"},
  {body: "What is your favorite book? Why do you like it? "},
  {body: "Do you like to rewatch movies? Which movies do you happen to rewatch the most?"},
  {body: "What is your favorite genre of music? Can you advise some nice performers?"},
  {body: "What is your favorite type of food, and what do you find special about it?"},
  {body: "Do you know any life hacks to discipline yourself and do stuff which you don't want or don't like? You can share some examples 😉"},
  {body: "What do you consider your biggest achievement? How did you come to it?"},
  {body: "What did you want to become when you were a kid? Do you have any career dreams (or goals) now?"},
  {body: "What is that you hated as a child, but adore now?"},
  {body: "Do you care for fashion? Why? If yes, what style do you prefer and do you have any favorite brands?"},
  {body: "Is there a particular place or environment where you feel most at peace or connected to yourself?"},
  {body: "How would you describe your personality in a few words?"},
  {body: "What is one thing you've always wanted to learn or try, but haven't had the chance to yet?"},
  {body: "What is your daily routine lifehack to make it easier to maintain a healthy lifestyle?"},
  {body: "Which region of Portugal is your favorite and why?"},
  {body: "Are you more inclined towards outdoor or indoor activities?"},
  {body: "Are you a morning person or a night owl? How does that impact your life?"},
  {body: "If you could have dinner with any historical figure, who would it be and why?"},
  {body: "What's your favorite season of the year? And why?"},
  {body: "Who are your favorite writers or poets? Can you suggest one of their books for everyone to read?"},
  {body: "If you could possess any superpower, what would it be, and how would you use it?"},
  {body: "Do you prefer to read physical books or use e-readers? And why?"},
  {body: "If you could travel back in time, which era would you choose to visit and why?"},
  {body: "What do you find most fascinating about the history of your native country?"},
  {body: "Have you participated in any traditional Portuguese festivities? If yes, what was your favorite experience?"},
  {body: "Is there any amusing tradition or custom in your native culture that you would like to share?"},
  {body: "What is your favorite way to celebrate or commemorate special occasions?"},
  {body: "What is your favorite form of creative expression (e.g., painting, writing, music)? How often do you find time to practice it?"},
  {body: "What is one thing you wish more people knew or understood about you?"},
  {body: "Do you have any particular hobbies or interests that you are currently passionate about?"},
  {body: "Are you more of a planner, or do you prefer to go with the flow in life? Have you ever found yourself in a funny / awkward situation because of it?"},
  {body: "Are you more drawn to big cities or quaint rural settings?"},
  {body: "What is one aspect of your personality or character that you're currently working on improving?"},
  {body: "What is your favorite way to show kindness or make a positive impact on others?"},
  {body: "What are some of your favorite ways to connect with nature and the outdoors?"},
  {body: "Do you have a guilty pleasure? Why do you like it?"},
  {body: "Do you do anything on a regular basis (or did before) to make the world a better place? Charity / volunteering / recycling etc."},
  {body: "Sweet or meet? Would you sooner skip the starter of the dessert?"},
  {body: "Let's talk about household chores! Which ones do you do with pleasure and which do you hate to do?"},
  {body: "Do you like fast food? Which type / restaurant chain is your favorite? What do you mostly choose there?"},
  {body: "If you were to choose the best invention of humanity, which impacted your life, what would it be and why?"}
]

questions.each do |question|
  next if Question.exists?(body: question[:body])

  Question.create(question)
end

companies = [
  {name: "Subvisual"},
  {name: "Invisible lab"},
  {name: "Onda"},
  {name: "Pink Room"},
  {name: "Universe"}
]

companies.each do |company|
  Company.find_or_create_by(name: company[:name])
end

skills = [
  {name: "Frontend dev"},
  {name: "Backend dev"},
  {name: "Blockchain"},
  {name: "Git / Github"},
  {name: "Databases"},
  {name: "Figma"},
  {name: "Adobe Creative Cloud"},
  {name: "Creative Coding"},
  {name: "Graphic Design"},
  {name: "Blender"},
  {name: "User Research"},
  {name: "Interface Design"},
  {name: "Experience Design"},
  {name: "Usability Testing"},
  {name: "Branding"},
  {name: "Analytics tools"},
  {name: "Marketing"},
  {name: "Communication"},
  {name: "Product exploration"},
  {name: "Strategic planning"},
  {name: "Sales"},
  {name: "HR"},
  {name: "Operations"}
]

skills.each do |skill|
  Skill.find_or_create_by(name: skill[:name])
end

hobbies = [
  {name: "Sports"},
  {name: "Hiking"},
  {name: "Padel / Paddle / Tennis"},
  {name: "Football"},
  {name: "Movies"},
  {name: "TV series"},
  {name: "Anime"},
  {name: "Making music"},
  {name: "Music genres"},
  {name: "Children"},
  {name: "Board games"},
  {name: "Cooking"},
  {name: "Traveling"},
  {name: "Art"},
  {name: "Languages"},
  {name: "Peers"},
  {name: "Photography"},
  {name: "Video gaming"},
  {name: "Gardening"},
  {name: "Handcraft"},
  {name: "Collecting"},
  {name: "Formula 1"},
  {name: "Reading"},
  {name: "Psychology"},
  {name: "Wellness / Meditation"},
  {name: "Tech / computers"},
  {name: "Outdoor activities"}
]

hobbies.each do |hobby|
  Hobby.find_or_create_by(name: hobby[:name])
end
