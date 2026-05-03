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
