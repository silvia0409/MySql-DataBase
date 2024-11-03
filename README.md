# Web-Development-Coursework
Coursework for my 1st year module- Introduction to Web Development

In this assignment, you are required to build a dynamic web application using PHP running on a
Web Server. It is also recommended to use Visual Studio Code as the development environment.
The technological and functional requirements relate to the development of a Music
Recommendation Site. The design for the application needs to support content that provides
useful information about a set of recommended music albums (referred to as ‘albums’ from now
on). You should also present additional content that is relevant to each album, such as providing a
personal recommendation score, among others.
Your application is expected to provide content on at least THREE individual albums available on
any streaming platform.
The specific features you are expected to implement as a MINIMUM are stated in the Application
Requirements section, later in this document.
The application is required to present the application front-end user interface to the user using a
combination of HTML5, CSS and JavaScript. The PHP application will be hosted on the web server
using the web root folder ‘www’ of UniServerZ. The user-interface should be dynamically generated
using PHP web development techniques.
The web application will be accessed via the Google Chrome web browser – this is the user’s
Client. The client-side user interface should utilise the Bootstrap front-end framework (any version
above v3.0) to render the HTML5 markup that comprises the content and structure of the site.
The site should be styled using CSS and work with both Mobile and Desktop clients. You should
also use Bootstrap-compatible JavaScript frameworks such as JQuery, Bootstrap.js,
FontAwesome.js etc for the client-side behaviours of your application. You may also incorporate
any other JavaScript frameworks that you deem useful to the development of your application.
You may use code and techniques from the module tutorials to assist you.
The software development toolset to develop this application has been provided to you through the
lab sessions, as detailed in the first tutorial session of this module.
You are expected to use Windows as your primary development platform, and is the ONLY
supported platform for development. You will need to find your own Web Server setup if you
wish to develop using other Operating Systems.
3
Supporting Information: Application Requirements / Specification
You will be assessed on both the functionality of your site and appropriateness of the dynamic web
application techniques used to implement this functionality.
Each of the pages described in the different features should be hyperlinked together with some
form of master page/common layout containing content that is present across all pages of the
application, such as a global navigation scheme – the layout of this navigation is up to you. The
majority of the content that the application serves to the user should be dynamically constructed
from appropriate file-based data sources that are stored on the server.
Feature A: A file of an appropriate format (e.g., JSON) that will include details for at least THREE
(3) music albums. The information stored should be at minimum the title of the album, the name of
the performer (singer/band), the genre, the total number of songs, the total time of all songs, the
release year, the producer, your own recommendation score, your own recommendation
description/critique of the album (it doesn’t have to be more than a few lines) and a unique id for
the album. Also, you need to create a folder that includes the albums covers.
Feature B: A home page that should provide a summary view of three of the albums available on
the site AND a short description of the purpose of the web application. The summaries should
display the album cover, the title of the album and the name of the performer. This information must
be dynamically retrieved from the file (e.g., JSON) you have created in Feature A.
Feature C: An individual album page which will display all the information stored in the file created
in Feature A, in a structured way, including the album cover and your own short recommendation
description/critique of the album. This information must be dynamically retrieved from the file (e.g.,
JSON) you have created in Feature A. The individual album page should be accessed and
constructed dynamically, using query strings (e.g., /album.php?id=1) and display the information for
the album provided as parameter in the query string.
Feature D: A ranking page that displays a tabular format of all albums with the following
information for each: the name of the album, the name of the performer, the release year, the
genre and your own recommendation score. This information must be dynamically retrieved from
the file (e.g., JSON) you have created in Feature A. It should also include a link to the individual
album’s page, created in Feature C, for each of the items. A sorting functionality for at least one
column (e.g., the own recommendation score) should be included. The implementation of the table
should be flexible enough to automatically display more albums if these are added later in the file
created in Feature A.
Feature E: A user registration and login mechanism with a minimum profile page. The user
registration should ask as a minimum the username, first name, last name, email and a password
for the user. Upon a successful registration the user details should be stored in a file (e.g., a JSON
file dedicated to store user profile details). Using these details, a login mechanism should be
offered and a user profile page which will allow users to update their personal details and set their
favourite album. When logged in, the user’s username should be displayed. This should be present
the whole time they are logged in, regardless of what part of the site they are on.
Feature F: The individual album page, created in Feature C, should be updated to include an
album review system which will only be available if the user is logged in. The logged in user should
4
be able to provide a rating (from 0 to 10) for the album along with a short comment through a form.
The rating, the comment and the username of the user should be stored in a file (e.g., a JSON file
dedicated to store user reviews) after the form submission. The same user can leave more than
one reviews for the same album. All existing reviews for the specific individual album should be
displayed on the specific individual album’s page.
You will be assessed on the technical quality of the view you produce in terms of its structure, style
and behaviour. Your web application should conform to the following web development
practices:
• The album data, user review data and user data should be dynamically generated each time the
site is viewed. To accomplish this, you will need to store data in files on the server. The types of
files are up to you, but common formats are plain text files, static HTML files, PNG/JPG images and
JSON Files – YOU ARE NOT PERMITTED TO USE AN SQL DATABASE IN THIS MODULE.
• The pages of application listed above should be split across multiple PHP pages to form your overall
application.
• The individual views should be connected together using a combination of navigation, hyperlinking,
query strings and cross-page form posting. Higher marks will be awarded for a site that is easy to
navigate via the page content, without relying on the browser navigation controls.
• The application views of the pages should be rendered using HTML5 markup using the Twitter
Bootstrap framework.
• The pages should be styled using a custom Bootstrap theme. The CSS should adhere to the
Bootstrap conventions for IDs and classes. You may also use graphical elements such as images,
glyphs and fonts to enhance the look of your application. The client-side technology
(HTML/CSS/JavaScript) used for adding graphics is up to you.
• Elements of the site that are common to each page and the global navigation scheme should be
placed in a master page, which all other pages utilise (the way your pages utilise this master page is
up to you).
• Your site layout should be responsive - not fixed to a particular resolution. Your site should be
viewable using Google Chrome browser on desktop/laptop PCs, tablets and smartphones.
• You should adopt the Mobile-First, Progressive Enhancement paradigm to develop your website.
• You should apply client-side technologies to enhance your site from both a usability and aesthetic
perspective. Examples include input data validation, animated elements, popups, etc.
• Your user profile and user review data that is transmitted from the client to the server is expected to
be validated server-side; you should not rely on client-side validation alone.
• An objected-oriented approach should be followed
