
# Fantastic_news

## A brief description of this project
A news app coded purely in Flutter which shows updated news of India and has a category section(Business, Technology, Sports and many more) to get news about. 
## Additional Dependencies Required
*  http: ^0.13.4 
* cached_network_image: ^3.1.0
* webview_flutter: ^2.1.2
To install these packages in Flutter

Run these commands:
```bash
 $ flutter pub add http
 $ flutter pub add cached_network_image
 $ flutter pub add webview_flutter
```
To import these in your project use the following codes:
```bash
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';

```


## Deployment

To deploy this project install flutter in your device,create a AVD through Android Studio or use a physical mobile through usb debbuging and run

```bash
  flutter run
```


## API Reference
**newsapi.org**

##### **To get API key :** 
 Create an account at ->https://newsapi.org/
##### **To Get news of India without any category in flutter**

```http
 http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=$api_key"))
```
 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your own API key |

##### **To Get news of India with categories in flutter**

```http
  http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$categoryname&apiKey=$api_key"))
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `categoryname`      | `string` | **Required**. category of news to fetch |
| `api_key` | `string` | **Required**. Your own API key|



## Documentation

* [Flutter Documentation](https://flutter.dev/docs)
* [NewsAPI Documentation](https://newsapi.org/docs)
