using HTTP
using JSON

function get_factorial()
    url = "http://localhost:9080/factorial/5"
    response = HTTP.get(url)

    if response.status != 200
        println("Error: Expected status code 200, got ", response.status)
        return false
    end

    json_data = JSON.parse(String(response.body))

    if json_data["factorial"] != 120
        println("Error: Expected factorial value 120, got ", json_data["factorial"])
        return false
    end

    return true
end

function main()
    if get_factorial()
        println("Test passed.")
    else
        println("Test failed.")
    end
end

main()

