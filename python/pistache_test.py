import requests

def get_factorial():
    url = "http://localhost:8000/factorial/5"
    response = requests.get(url)

    if response.status_code != 200:
        print(f"Error: Expected status code 200, got {response.status_code}")
        return False

    json_data = response.json()

    if json_data["factorial"] != 120:
        print(f"Error: Expected factorial value 120, got {json_data['factorial']}")
        return False

    return True

if __name__ == "__main__":
    if get_factorial():
        print("Test passed.")
    else:
        print("Test failed.")
