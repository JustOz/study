#include <iostream>


bool IsPrime(const uint64_t &number)
{
    if (!(number % 2))
    {
        return false;
    }

    uint64_t i;

    for (i = 3; i * i <= number; i += 2)
    {
        if (!(number % i))
        {
            return false;
        }
    }

    return true;
}


int main()
{
    uint64_t cap = 2000000;
    uint64_t sum = 2;
    uint64_t i = 3;

    while (i < cap) {
        if (IsPrime(i)) {
            sum += i;
        }

        i += 2;
    }

    std::cout << sum << '\n';

    return 0;
}