(in-package :arle-utility-test)

(is (arle-utility:chomp "abc
")
    "abc")
(is (arle-utility:chomp "cde")
    "cde")
(is (arle-utility:chomp "
fgh
")
    "
fgh")

(is-values
    (arle-utility:parse-request-line "GET / HTTP/1.1")
    '("GET" "/" "HTTP/1.1"))
(is-values
    (arle-utility:parse-request-line "CONNECT www.google.com:443 HTTP/1.1")
    '("CONNECT" "www.google.com:443" "HTTP/1.1"))

(is (arle-utility:extract-uri "<a href=\"http://www.google.com\">Google</a>")
    "http://www.google.com")
(is (arle-utility:extract-uri "Yahoo天気東京 https://weather.yahoo.co.jp/weather/jp/13/4410.html")
    "https://weather.yahoo.co.jp/weather/jp/13/4410.html")

(is-values
    (arle-utility:parse-uri "http://www.google.com")
    '("http" "www.google.com" nil nil))
(is-values
    (arle-utility:parse-uri "https://weather.yahoo.co.jp/weather/jp/13/4410.html")
    '("https" "weather.yahoo.co.jp" nil "/weather/jp/13/4410.html"))
(is-values
    (arle-utility:parse-uri "http://localhost:8080/index.html")
    '("http" "localhost" "8080" "/index.html"))

(finalize)
