#include <iostream>
#include <cmath>


int SumOfSquares(int limit) {
    int sum = 0;

    for (int i = 1; i <= limit; i++) {
        sum += std::pow(double(i), 2);
    }

    return sum;
}

int SquareOfSum(int limit) {
    int sum = 0;

    for (int i = 1; i <= limit; i++) {
        sum += i;
    }

    return int(std::pow(sum, 2));
}


int main()
{
    int s1 = SumOfSquares(100);
    int s2 = SquareOfSum(100);

    std::cout << s2 - s1 << '\n';


    return 0;
}