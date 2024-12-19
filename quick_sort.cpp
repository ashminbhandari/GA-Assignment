// 1. Write a program in C++ that implements Quicksort without using recursion.
// (hint: this needs a stack; see the lecture video from Jan 23. Use the C++ STL to get a Stack.
// Your stack objects will contain the ends of the array slice.
// You can use the partition function from your C++ text. You should not be writing much code on your own.)

#include <iostream>
#include <stack>

using namespace std;

int sub_sort(int arr[], int i, int j)
{
    // choosing a random pivot
    int pivot_idx = i + rand() % (j - i + 1);
    int pivot_value = arr[pivot_idx];

    // move pivot element to the end
    swap(arr[j], arr[pivot_idx]);

    int swap_idx = i;

    for (int k = i; k < j; k++)
    {
        if (arr[k] <= pivot_value)
        {
            swap(arr[k], arr[swap_idx]);
            swap_idx++;
        }
    }

    // swap the pivot element back to position i.e. current swap index
    swap(arr[swap_idx], arr[j]);

    return swap_idx;
}

void quick_sort(int arr[], int n)
{
    // stack to hold start and end indices of partitions
    stack<pair<int, int>> partitions;

    partitions.push({0, n - 1});

    while (!partitions.empty())
    {
        pair<int, int> p = partitions.top();
        partitions.pop();
        int i = p.first;
        int j = p.second;

        int pivot_idx = sub_sort(arr, i, j);
        if (i < pivot_idx - 1)
        {
            partitions.push({i, pivot_idx - 1});
        }
        if (pivot_idx + 1 < j)
        {
            partitions.push({pivot_idx + 1, j});
        }
    }
}

void print_array(int arr[], int n)
{
    for (int i = 0; i < n; i++)
    {
        cout << arr[i] << " ";
    }
    cout << endl;
}

int main()
{
    // RNG seed
    srand(time(NULL));

    // Test case 1
    int arr1[] = {5, 2, 9, 1, 5, 6};
    int n1 = sizeof(arr1) / sizeof(arr1[0]);
    cout << "Test case 1: Before sorting\n";
    print_array(arr1, n1);
    quick_sort(arr1, n1);
    cout << "Test case 1: After sorting\n";
    print_array(arr1, n1);

    // Test case 2
    int arr2[] = {1, 2, 3, 4, 5, 6, 1};
    int n2 = sizeof(arr2) / sizeof(arr2[0]);
    cout << "\nTest case 2: Before sorting\n";
    print_array(arr2, n2);
    quick_sort(arr2, n2);
    cout << "Test case 2: After sorting\n";
    print_array(arr2, n2);

    // Test case 3
    int arr3[] = {6, 5, 4, 3, 2, 1};
    int n3 = sizeof(arr3) / sizeof(arr3[0]);
    cout << "\nTest case 3: Before sorting\n";
    print_array(arr3, n3);
    quick_sort(arr3, n3);
    cout << "Test case 3: After sorting\n";
    print_array(arr3, n3);

    // Test case 4
    int arr4[] = {3, 1, 2, 1, 2, 3};
    int n4 = sizeof(arr4) / sizeof(arr4[0]);
    cout << "\nTest case 4: Before sorting\n";
    print_array(arr4, n4);
    quick_sort(arr4, n4);
    cout << "Test case 4: After sorting\n";
    print_array(arr4, n4);

    // Test case 5
    int arr5[] = {42, 41, 40};
    int n5 = sizeof(arr5) / sizeof(arr5[0]);
    cout << "\nTest case 5: Before sorting\n";
    print_array(arr5, n5);
    quick_sort(arr5, n5);
    cout << "Test case 5: After sorting\n";
    print_array(arr5, n5);

    return 0;
}