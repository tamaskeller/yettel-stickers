# Yettel Highway Vignette App Sample
###### YHVAS for short

### How-To

1. Make sure Docker is installed on your computer
4. Execute the following from the project's root:
    1. docker build -t php-server .
    2. docker run -p 8080:8080 php-server
5. The mock server should be running now on your local computer, so the app should be able to access it during runtime.
6. HTTP in itself is prohibited by iOS, so make sure to enable it in Project Settings, in case you are using the source code from a fresh project file.
    1. Go to Project Settings, set NSAllowsArbitraryLoads to YES in Info.plist
7. Enjoy

## TO-DO

1. Error handling has room for improvement for different cases.
2. More unit tests. (Coverage can never be enough).
3. One of the harder tasks (county non-neighbourhood alert) need implementing. Basis for graph-based solution is included in the project.
5. Constants (especially dimensional) need to be in their respective enums and/or utility classes.
7. Alamofire was chosen as a lib to quicken work, own custom implementation would be preferred for simple URLSession operations.
8. The design has much room for improvement from the development side. Font types and sizes, better layout, etc.
