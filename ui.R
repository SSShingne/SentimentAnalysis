library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Twitter Sentiment Analysis"),
  
  sidebarPanel(
    
    textInput("searchTerm", "Enter data to be searched with '#'", "#"),
    sliderInput("maxTweets","Number of recent tweets to use for analysis:",min=5,max=1000,value=500), 
    submitButton(text="Analyse")
    
  ),
  
  mainPanel(
    
    
    tabsetPanel(
      
      tabPanel("Top Trending Topics Today",HTML("<div></div>"),
               
      selectInput("trendingTable","Choose location to extract trending topics",c("Worldwide","Afghanistan","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica",
                                                                                          "Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain",
                                                                                          "Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Brazil",
                                                                                          "British Indian Ocean Territory","Bulgaria","Burundi","Cambodia","Cameroon","Canada","Cayman Islands",
                                                                                          "Central African Republic","Chad","Chile","China","Colombia","Comoros","Congo","Cook Islands","Costa Rica",
                                                                                          "Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador",
                                                                                          "Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands",
                                                                                          "Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland",
                                                                                          "Grenada","Guadeloupe","Guam","Guatemala","Guinea","Guinea-bissau","Guyana","Vatican City","Honduras",
                                                                                          "Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica",
                                                                                          "Japan","Jordan","Kazakhstan","Kenya","Kiribati","Democratic People's Republic of Korea","Republic of Korea",
                                                                                          "Kuwait","Kyrgyzstan","Lao People's Democratic Republic","Latvia","Lebanon","Lesotho","Liberia",
                                                                                          "Libyan Arab Jamahiriya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia","Madagascar","Malawi","Malaysia",
                                                                                          "Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico",
                                                                                          "Micronesia","Republic of Moldova","Monaco","Mongolia","Montserrat","Morocco","Mozambique","Myanmar",
                                                                                          "Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua",
                                                                                          "Niger","Nigeria, Niue","Norfolk Island","Northern Mariana Islands","Norway","Oman","Pakistan","Palau",
                                                                                          "Palestinian Territory Occupied","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn",
                                                                                          "Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russian Federation","Rwanda","Saint Helena",
                                                                                          "Saint Kitts and Nevis","Saint Lucia","Saint Pierre and Miquelon","Saint Vincent and The Grenadines","Samoa",
                                                                                          "San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia and Montenegro","Seychelles","Sierra Leone",
                                                                                          "Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and The South Sandwich Islands",
                                                                                          "Spain","Sri Lanka","Sudan","Suriname","Svalbard and Jan Mayen","Swaziland","Sweden","Switzerland",
                                                                                          "Syrian Arab Republic","Taiwan","Province of China","Tajikistan","United Republic of Tanzania","Thailand",
                                                                                          "Timor-leste","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands",
                                                                                          "Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands",
                                                                                          "Uruguay","Uzbekistan","Vanuatu","Venezuela","Vietnam","Virgin Islands","British","Virgin Islands","U.S.",
                                                                                          "Wallis and Futuna","Western Sahara","Yemen","Zambia", "Zimbabwe"), selected = "Worldwide", selectize = FALSE),
               submitButton(text="Search"),
               tableOutput("trendtable"),
               HTML
               ("<div> </div>")),
      
      
      tabPanel("WordCloud",HTML("<div><h3>Most used words</h3></div>"),plotOutput("word"),
               HTML
               ("<div><h4> 
                 </h4></div>")),
      
      
      tabPanel("Histogram",HTML
               ("<div><h3> Histograms graphically depict the positivity or negativity of peoples' opinion about of the hashtag
                 </h3></div>"), plotOutput("histPos"), plotOutput("histNeg"), plotOutput("histScore"),plotOutput("histNRC")
      ),
      
      
      tabPanel("Top Charts",HTML
               ("<div><h3> Top 20 users who used that Hashtag</h3></div>"),plotOutput("tweetersplot"), tableOutput("tweeterstable"))
      
    )
  )
))