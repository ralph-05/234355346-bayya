import java.util.Scanner;

public class ArrayAddressCalculator {
    
    public static int rowMajorAddress(int base, int size, int[] dimensions, int[] target){
        int address = base;
        int product = 1;
        for (int i = dimensions.length - 1; i >= 0; i-- ) {
            address += size * product * target[i];
            product *= dimensions[i];
        }
        return address;
    }

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the base address:");
        int base = sc.nextInt();
        System.out.println("Enter the size address:");
        int size = sc.nextInt();
        System.out.println("Enter the number of dimensions:");
        int n = sc.nextInt();
        int[] dimensions = new int[n];
        int[] target = new int[n];
        System.out.println("Enter the upper bound of each dimension:");
        for (int i = 0; i < n; i++ ){
            dimensions[i] = sc.nextInt();
        }
        System.out.println("Enter the address to look for in each dimension:");
        for (int i = 0; i < n; i++) {
            target[i] = sc.nextInt();
        }
        sc.close();
        int result = rowMajorAddress(base, size, dimensions, target);
        System.out.println("The address of the element is:" + result);
    }
}
