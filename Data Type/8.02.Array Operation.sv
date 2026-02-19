module tb;

  int arr1[5]  = '{1, 2, 3, 4, 5}; 
  int arr2[5]  = '{7, 2, 10, 45, 9};
  int arr3[5]  = '{7, 2, 10, 45, 9};
  int arr4[]   = '{1, 6, 4, 2, 1, 8, 7, 3, 3}; 
  int arr5[$]  = '{1, 2, 2, 3, 3, 3, 4, 5, 6, 6, 7};

  initial begin

    // 1. Reverse the fixed-size array in place
    arr1.reverse();
    $display("Reverse      = %p", arr1);

    // 2. Sort the fixed-size array in ascending order
    arr2.sort();
    $display("Sort Asc     = %p", arr2);

    // 3. Sort the fixed-size array in descending order
    arr3.rsort();
    $display("Sort Desc    = %p", arr3);

    // 4. Randomly shuffle elements of dynamic array
    arr4.shuffle();
    $display("Shuffle      = %p", arr4);

    // 5. Remove duplicate elements from queue
    // unique() returns a queue, so arr5 must be queue type
    arr5 = arr5.unique();
    $display("Unique       = %p", arr5);

    // 6. Return number of elements in fixed-size array
    $display("Size arr1    = %0d", $size(arr1));

  end

endmodule
