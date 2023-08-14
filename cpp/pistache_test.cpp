#include <iostream>
#include <cpr/cpr.h>
#include <nlohmann/json.hpp>

bool get_factorial() {
    auto r = cpr::Get(cpr::Url{"http://localhost:8000/factorial/5"});
    if (r.status_code != 200) {
        std::cerr << "Error: Expected status code 200, got " << r.status_code << std::endl;
        return false;
    }

    // Parse the response body as JSON
    auto json = nlohmann::json::parse(r.text);
    
    // Check the values in the JSON
    if (json["factorial"] != 120) {
        std::cerr << "Error: Expected factorial value 120, got " << json["factorial"] << std::endl;
        return false;
    }

    return true;
}

int main() {
    if (get_factorial()) {
        std::cout << "Test passed." << std::endl;
        return 0;
    } else {
        std::cout << "Test failed." << std::endl;
        return 1;
    }
}

