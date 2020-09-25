# POKEAPP ZipDev

Flutter Challenge for ZipDev

Pokemon App!


## Installation

- All the `code` is required for run the app
- Need to have a `phone` with android version  connected or an `Android Emulator`

### Clone

- Clone this repo to your local machine using `https://github.com/DarkMarksDoe/pokeapp`

### Setup

> clone the repositor,y and get all the packages first

```shell
$ git clone https://github.com/DarkMarksDoe/pokeapp.git
$ cd pokeapp
```

> now update all the flutter packages
```shell
$ flutter pub get
```
> and now youre ready to run the app
```shell
$ flutter run
```

# Packages
For save images into caché and avoid download the same image twice, so the plugin that i used was: 
`cached_network_image` at version `2.0.0`.
<br><br>
When i need to campare Objects with the same values, and avoid using the hash, the plugin Equality help you. 

The plugin is:
`equatable` at version `1.2.5`.
<br><br>
In StateManagement, the easiest way (for me) is using Provider, provider was used only for update values of the list of pokes.

The Plugin is:
`provider`: at version `4.3.2`.
<br><br><br>
For consuming HTTP/HTTPS services, the best, the reliable old is `http`. 

The plugin is:
 `http`: at version `0.12.2`.
<br><br><br>
Hive is a good option when local data is required, but, it helps for multiple data, in this example, is just a simple JSON and a bool, so the classic one is `shared_preferences`.

The plugin is: `shared_preferences` at version `0.5.12`.
<br><br><br>
The Boarding Pages or Welcome Pages, has a style, that is usually an image, some text, and buttons at the bottom, for avoid create too much code, classes and files, I used `Introduction Screen`.

The plugin is: `introduction_screen` at version `1.0.9`.