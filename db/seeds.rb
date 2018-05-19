admin = Admin.create! email: ENV['ADMIN_EMAIL'],
                      password: ENV['ADMIN_PASSWORD'],
                      first_name: ENV['ADMIN_FIRST_NAME'],
                      last_name: ENV['ADMIN_LAST_NAME'],
                      username: ENV['ADMIN_USERNAME'],
                      website: ENV['ADMIN_WEBSITE'],
                      avatar: Rails.root.join('app/assets/images/avatar.png').open,
                      extended_bio: ENV['ADMIN_EXTENDED_BIO'],
                      projects_completed: 14,
                      happy_clients: 18,
                      phone: ENV['ADMIN_PHONE'],
                      address: ENV['ADMIN_ADDRESS'],
                      city_code: ENV['ADMIN_CITY_CODE'],
                      neighborhood: ENV['ADMIN_NEIGHBORHOOD'],
                      zipcode: ENV['ADMIN_ZIPCODE'],
                      country_code: ENV['ADMIN_COUNTRY_CODE'],
                      brief_bio: ENV['ADMIN_BRIEF_BIO']

Skill.create! name: 'Ruby', percentage: 90, admin: admin
Skill.create! name: 'HTML && CSS', percentage: 70, admin: admin
Skill.create! name: 'SQL', percentage: 85, admin: admin
Skill.create! name: 'Swift', percentage: 55, admin: admin
Skill.create! name: 'React', percentage: 70, admin: admin
Skill.create! name: 'Vanilla JavaScript', percentage: 80, admin: admin
Skill.create! name: 'Angular JS', percentage: 75, admin: admin


WorkExperience.create! start_at: Date.new(2014, 7, 1),
                       end_at: Date.new(2016, 4, 1),
                       company: 'Freelance',
                       position: 'Developer',
                       description: 'I worked as a freelance developer, developing web and desktop applications for different clients.',
                       admin: admin

WorkExperience.create! start_at: Date.new(2015, 2, 2),
                       end_at: Date.new(2016, 5, 2),
                       company: 'Rootstrap',
                       position: 'Developer',
                       description: 'I started working as a developer at Rootstrap, a fascinating software company of web and mobile apps from startups to publicly traded companies. I worked on many projects doing both frontend and backend staff.',
                       admin: admin

WorkExperience.create! start_at: Date.new(2016, 5, 3),
                       end_at: Date.new(2017, 5, 31),
                       company: 'Rootstrap',
                       position: 'Team Leader',
                       description: 'In addition to work as a developer, I supervise, motivate and guide teams, help them to work as a team and ensure to give to the client the best experience during the whole development process.\r\n',
                       admin: admin

WorkExperience.create! start_at: Date.new(2017, 6, 1),
                       company: 'Rootstrap',
                       position: 'Senior Team Leader',
                       description: 'I was promoted to Senior Team Leader, which gives me more responsibilities. I continue guiding teams, helping on technical issues and developing apps while being more involved with clients.',
                       admin: admin


Recommendation.create! recommendation_text: 'Guille was an integral team member in developing the MVP for my mobile application. He was thoughtful and deliberate in his work and offered creative solutions to difficult problems. I would certainly bring him in for future projects and recommend him to anyone looking for knowledgable and independent team leader.',
                       recommender_name: 'Jeffrey Warshauer',
                       recommender_avatar: 'https://media.licdn.com/dms/image/C4D03AQFEvR4p_eDvSw/profile-displayphoto-shrink_100_100/0?e=1531958400&v=beta&t=wMNuj9QdYaz7GWPBCBf5b_HvkANgVDgA5cSpZ6aihtE',
                       recommender_role: 'Founder',
                       recommender_company: 'Live Music Loyalty',
                       admin: admin

Recommendation.create! recommendation_text: 'I\'ve known Guillermo for a very long time and he is the person you want for any kind of project. I have never met a person who can manage a team so well. Not only he is responsible but he knows how to take care of every concern you or the team members have. He will understand you, even if you do not have a clear idea of what you want. Guillermo has a rich set of skills both technically and personal, and knows how to communicate effectively, which makes him a complete and amazing team leader and developer.',
                       recommender_name: 'Federico Martinez',
                       recommender_avatar: 'https://media.licdn.com/dms/image/C5603AQFYp0uZL2OZ0g/profile-displayphoto-shrink_100_100/0?e=1531958400&v=beta&t=xc70G2gRpuu3W_W724jCEVyKYjO1tNl9F6Rsm_F7DdM',
                       recommender_role: 'Full-Stack Developer',
                       admin: admin
