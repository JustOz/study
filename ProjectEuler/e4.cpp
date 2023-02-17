#include <algorithm>
#include <iostream>
#include <string>


bool IsPalindrome(std::string a)
{
    const std::string b = a;
    std::reverse(a.begin(), a.end());

    return !(a.compare(b));
}


int main()
{
    int limit = 999999;
    int begin = 100000;
    int max = 0;
    int i;
    int j;

    for (i = 100; i < 999; i++)
    {
        for (j = 100; j < 999; j++)
        {
            if (IsPalindrome(std::to_string(i * j)))
            {
                if (max < i * j) {
                    max = i * j;
                }
            }
        }
    }
    
    std::cout << "answer: " << max << '\n';
    return 0;
}