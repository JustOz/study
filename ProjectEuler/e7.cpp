#include <iostream>
#include <climits>


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


int GetNthPrime(int n)
{
    int counter = 1;
    int i = 3;

    while (counter < n) {
        if (IsPrime(i)) {
            counter += 1;
        }
        i += 2;
    }

    return i - 2;
}

int main()
{
    int i = GetNthPrime(5);

    std::cout << i << '\n';

    return 0;
}