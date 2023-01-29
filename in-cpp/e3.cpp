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
    const uint64_t n = 600851475143;
    uint64_t max = 0;
    uint64_t i = 0;

    for (i = 3; i * i <= n; i += 2)
    { 
        {
            if (IsPrime(i))
            {
                max = i;
            }
        }
    }

    std::cout << "answer: " << max << '\n';

    return 0;
}