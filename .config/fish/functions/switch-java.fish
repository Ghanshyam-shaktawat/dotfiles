function switch-java
    if test (count $argv) -ne 1
        echo "Usage: No argument passed! switch java version with argument."
        echo "1: Java-1.8.0"
        echo "2: Java-17"
    end

    sudo update-java-alternatives -s jdk-17-oracle-x64
    # sudo update-java-alternatives -s java-1.8.0-openjdk-amd64

    set --local input $argv[-1]

    switch $input
        case 1
            sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
            or return $status
        case 2
            sudo update-java-alternatives -s jdk-17-oracle-x64
            or return $status
        case '*'
            echo "Invalid argument. Use 1 or 2"
            return 1
    end

    echo "Java version switched"
end
