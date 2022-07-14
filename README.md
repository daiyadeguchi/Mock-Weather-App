<h1 align="center">Dumb Weather App</h1>
<p align="center"><strong>Description</strong>
<br>This is a weather app personal project. I made this app to learn how to write UIKit app programmatically.
<br><em>*Only Tokyo weather data at this point!</em>
<br>*Location based data and search function is coming up</p>
<div align="center"><img src="demo.gif"></img></div>
<h2>About</h2>

Simple weather app to fetch weather data from OpenWeatherAPI. <br/>
Started out as mock iOS weather app with UIKit, it, however, turned out too much features to implement for study project. <br/>
(Also, free tier OpenWeatherAPI was not enough to implement most of them)<br/>
Therefore, following are features of the app!<br/>
*All features are only of Tokyo as of now.<br/>
- Current Weather
- 3 Hour Forecast
- 5 Day Forecast

<h2>Key learnings</h2>

- Programmatically written UIKit
  - UITableView with custom cell
  - UICollectionView
  - AutoLayout
- API Implementation with delegation pattern
- MVC design pattern

<h2>Installation</h2>

1. Clone the project in Xcode
2. Registar free tier account on <a href="https://openweathermap.org/">OpenWeather</a>
3. Create API key (See below on how to create API key on OpenWeather)
4. Right click the "Model" folder and create new plist file "OpenWeather-Info"
5. In the file, create new property with "API_KEY" as Key, "String" as Type, and your API key created at no.3 above as Value
6. Run the project with any iPhone simulator

<h3>How to Create API Key on OpenWeather</h3>

1. Click "My API Key" on your username dropdown menu on top right corner
2. On "Create Key" section of the page, give it any name you like (e.g. WeatherApp)
3. Click "Generate" button
