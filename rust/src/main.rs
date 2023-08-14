use reqwest;
use serde_json::Value;
use std::error::Error;

async fn get_factorial() -> Result<bool, Box<dyn Error>> {
    let url = "http://localhost:9080/factorial/5";
    let response = reqwest::get(url).await?;

    if response.status() != 200 {
        eprintln!("Error: Expected status code 200, got {}", response.status());
        return Ok(false);
    }

    let json_data: Value = response.json().await?;

    if json_data["factorial"] != 120 {
        eprintln!(
            "Error: Expected factorial value 120, got {}",
            json_data["factorial"]
        );
        return Ok(false);
    }

    Ok(true)
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    if get_factorial().await? {
        println!("Test passed.");
    } else {
        println!("Test failed.");
    }

    Ok(())
}

