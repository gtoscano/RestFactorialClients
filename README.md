# RestFactorialClient

RestFactorialClient is a collection of client implementations that interact with a RESTful API to calculate the factorial of a given number. 

In this repository, we provide integration examples demonstrating how to connect a factorial function implemented in a RESTful API server with client codes in languages such as C#, Go, Java, JavaScript, Julia, Octave, Python, and R. 



## Project Purpose

The primary goal of RestFactorialClient is to explore various methods for calling external code from different programming languages. 

These clients can connect to the different server examples:


- **PistacheFactorial**: A PistacheFactorial implementation that provides an endpoint to calculate the factorial of a given number. The project can be found [here](https://github.com/gtoscano/PistacheFactorial).
    

- **FastAPIFactorial**: A FastAPI implementation that provides an endpoint to calculate the factorial of a given number. The project can be found [here](https://github.com/gtoscano/FastAPIFactorial).

- **DjangoFactorial**: A Django implementation using the Django REST Framework to provide a similar factorial calculation endpoint. The project can be found [here](https://github.com/gtoscano/DjangoFactorial).

Through these methods, RestFactorialClient demonstrates various techniques for integrating code into applications written in different programming languages. 


## Usage
### Compile all examples
```
git clone git@github.com:gtoscano/RestFactorialClients.git
mkdir build
cd build
cmake ..
make
```

### Call all examples

Each client in this collection sends a GET request to the API endpoint:

```
http://localhost/factorial/{number}
```

Replace `{number}` with the integer for which you want to calculate the factorial.

## Implementations

### C++

```
cd cpp
./cpp_client

```

### C#

```
cd  csharp
mono CSClient.exe

```


### Golang
```
go run pistache.go
```


### Java
```
cd java
java -cp .:json-20210307.jar Main
```

### Julia
```
julia pistache_test.jl
```


### Octave

```
octave pistache_test.m
```

### Python

```
python pistache_test.py
```
### R

```
Rscript pistache_test.R
```

### Rust
```
cd rust
./pistache_test
```
or 
```
cargo build --release
cd target/release
./pistache_test

```

### Compile C++, C#, Rust indpendently
C++, C#, and Rust, have their own CMakeLists.txt file. Therefore the user can do the following, in their respective source directory.

```
mkdir build
cd build
cmake ..
make
```


## Contributing

Contributions to this project are welcome! Please feel free to fork the repository, create a feature branch, and submit a pull request.

## License

This project is licensed under the Apache License. See the [LICENSE](LICENSE) file for details.

## Contact

Feel free to reach out with any questions, issues, or feedback.

