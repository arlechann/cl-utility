(in-package :arle-utility-test)

(subtest
  "chomp"
  (is
    (chomp "abc
")
    "abc")
  (is
    (chomp "cde")
    "cde")
  (is
    (chomp "
fgh
")
    "
fgh")
  )

(subtest
  "parse-request-line"
  (is-values
    (parse-request-line "GET / HTTP/1.1")
    '("GET" "/" "HTTP/1.1"))
  (is-values
    (parse-request-line "CONNECT www.google.com:443 HTTP/1.1")
    '("CONNECT" "www.google.com:443" "HTTP/1.1"))
  )

(subtest
  "extract-uri"
  (is (extract-uri "<a href=\"http://www.google.com\">Google</a>")
      "http://www.google.com")
  (is (extract-uri "Yahoo天気東京 https://weather.yahoo.co.jp/weather/jp/13/4410.html")
      "https://weather.yahoo.co.jp/weather/jp/13/4410.html")
  )

(subtest
  "parse-uri"
  (is-values
    (parse-uri "http://www.google.com")
    '("http" "www.google.com" nil nil))
  (is-values
    (parse-uri "https://weather.yahoo.co.jp/weather/jp/13/4410.html")
    '("https" "weather.yahoo.co.jp" nil "/weather/jp/13/4410.html"))
  (is-values
    (parse-uri "http://localhost:8080/index.html")
    '("http" "localhost" "8080" "/index.html"))
  )

(finalize)
