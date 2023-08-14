% pistache_test.m

url = "http://localhost:9080/factorial/5";
response = urlread(url);

% Parse the JSON response manually or using a custom JSON parser
% Here, I'll assume a simple JSON structure and extract the factorial value using regular expressions
factorial_str = regexp(response, '"factorial":\s*(\d+)', 'tokens'){1}{1};
factorial = str2double(factorial_str);

if isempty(factorial) || factorial != 120
  fprintf("Error: Expected factorial value 120, got %d\n", factorial);
  success = false;
else
  success = true;
end

if success
  disp("Test passed.");
else
  disp("Test failed.");
end

