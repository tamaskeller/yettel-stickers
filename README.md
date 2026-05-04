# Yettel Highway Vignette App Sample
###### YHVAS for short

### How-To

1. Make sure Docker is installed on your computer
2. Copy the Dockerfile and .php script into your project's root
3. Execute the following:
    1. docker build -t php-server .
    2. docker run -p 8080:8080 php-server
4. The mock server should be running now on your local computer, so the app should be able to access it during runtime.
5. HTTP in itself is prohibited by iOS, so make sure to enable it in Project Settings.
    1. Go to Project Settings, set NSAllowsArbitraryLoads to YES in Info.plist
6. Enjoy

## TO-DO

1. The flow in currently incomplete, needs finishing (currently in progress).
2. Among others, error/loading handling needs to be done.
3. Unit tests.
4. One of the harder tasks (county non-neighbourhood alert) need implementing. 
    NOTE: I'd like to solve it with a graph or a neighbourhood-matrix.
5. Folder cleanup so everything is in the right place.
6. Constants (especially dimensional) need to be in their respective enums and/or utility classes.
7. Strings should be localized and provided by a utility class.
8. Alamofire was chosen as a lib to quicken work, own custom implementation would be preferred.
9. The design has much room for improvement from the development side.
