import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.json.JSONObject;

public class Main {

    public static boolean getFactorial() {
        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(new URI("http://localhost:9080/factorial/5"))
                    .build();
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() != 200) {
                System.err.println("Error: Expected status code 200, got " + response.statusCode());
                return false;
            }

            // Parse the response body as JSON
            JSONObject json = new JSONObject(response.body());

            // Check the values in the JSON
            if (json.getInt("factorial") != 120) {
                System.err.println("Error: Expected factorial value 120, got " + json.getInt("factorial"));
                return false;
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        if (getFactorial()) {
            System.out.println("Test passed.");
            System.exit(0);
        } else {
            System.out.println("Test failed.");
            System.exit(1);
        }
    }
}

