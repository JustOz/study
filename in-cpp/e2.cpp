#include <iostream>


int main()
{
    unsigned int a = 1;
    unsigned int b = 1;
    unsigned int c = 0;
    unsigned long sum = 0;

    while (c < 4000000)
    {
        c = a + b;
        a = b;
        b = c;

        if (a % 2 == 0)
        {
            sum += a;
        }
    }

    std::cout << "answer: " << sum << '\n';


    return 0;
}