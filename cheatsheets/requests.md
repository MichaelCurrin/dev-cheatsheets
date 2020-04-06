# Requests

See also [shell/requests.md](shell/requests.md).


## Request bins

Domains and URLs to use when testing your application. This is useful when doing a manual or automated test and also when adding a request to your docs that can be run by a user.


### HTTP bin

- [httpbin.org/](https://httpbin.org/) homepage

Run requests in the browser and generate equivalent `curl` command. You can convert this to use with a requests library in a language.

#### GET

```
curl -X GET "https://httpbin.org/get" -H  "accept: application/json"
```

## Language samples

### Get requests

See [RosettaCode](https://www.rosettacode.org/wiki/HTTP).

### Post requests

[source](http://requestbin.net/)

Bash:

```sh
curl -X POST -d "fizz=buzz" 'https://httpbin.org/post'
```

Python:

```python
import time

import requests


r = requests.post(
    'https://httpbin.org/post', 
    data={"ts":time.time()}
)
print(r.status_code)
print(r.content)
```

NodeJS:

```javascript
var request = require('request');

var url = 'https://httpbin.org/post'
request(url, function (error, response, body) {
  if (!error) {
    console.log(body);
  }
});
```

Ruby:

```ruby
require 'open-uri'

resp = open('https://httpbin.org/post')
resp.lines { |f| f.each_line {|line| p line} }
```

PHP:

```php
<?php
    $resp = file_get_contents('https://httpbin.org/post');
    echo $resp;
?>
```

Java:

```java
import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.*;
import org.apache.commons.httpclient.params.HttpMethodParams;

import java.io.*;

public class RequestBinTutorial {
    public static void main(String[] args) {
        HttpClient client = new HttpClient();
        GetMethod method = new GetMethod("https://httpbin.org/post");
        
        try {
            int statusCode = client.executeMethod(method);
            byte[] responseBody = method.getResponseBody();
            System.out.println(new String(responseBody));
        } catch (Exception e) {
            System.err.println("Fatal error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            method.releaseConnection();
        }
    }
}
```
