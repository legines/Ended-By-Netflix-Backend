# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Show.create!([
    {  title: 'House of Cards',
       subgenre: 'Political drama',
       description: "U.S. Rep. Francis Underwood of South Carolina starts out as a ruthless politician seeking revenge in this Netflix original production. Promised the post of Secretary of State in exchange for his support, his efforts help to ensure the election of Garrett Walker to the presidency. But Walker changes his mind before the inauguration, telling Underwood he's too valuable in Congress. Outwardly, Underwood accepts his marching orders, but secretly he and his wife Claire, an environmental activist, make a pact to destroy Walker and his allies. As the series progresses, Underwood ascends through the ranks of the government -- until his death, at which point Claire gains power. Based on the U.K. miniseries of the same name, the U.S. version offers a look behind the scenes at the greed and corruption in American politics. A number of real-life media figures make cameo appearances.",
       canceled_description: '',
       premiere: 2/1/2013,
       finale: 11/2/2018,
       seasons: '6 seasons, 73 episodes',
       runtime: '42–59 min.',
       canceled: 1
    },
    {  title: 'Orange Is the New Black',
       subgenre: 'Comedy drama',
       description: "Piper Chapman is a public relations executive with a career and a fiance when her past suddenly catches up to her. In her mid-30s she is sentenced to spend time in a minimum-security women's prison in Connecticut for her association with a drug runner 10 years earlier. This Netflix original series is based on the book of the same title. Forced to trade power suits for prison orange, Chapman makes her way through the corrections system and adjusts to life behind bars, making friends with the many eccentric, unusual and unexpected people she meets.",
       canceled_description: '',
       premiere: 7/11/2013,
       finale: 7/26/2019,
       seasons: '7 seasons, 91 episodes',
       runtime: '50–92 min.',
       canceled: 1
    },
])