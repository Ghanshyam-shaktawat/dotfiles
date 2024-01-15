function speedtest --description 'Internet speed test'
    wget -O /dev/null http://131.153.76.66/sin-1gb.test $argv
end
