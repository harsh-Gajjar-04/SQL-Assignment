class LimitedNoOfClasses {
    public static void main(String[] args) {
        for(int i=0 ; i<20 ;i++){
            Test.createInstance();
        }
        
    }
    
}

class Test{
    static int count = 0;
    private Test(){
       System.out.println("count:" +count);
    }
    public static Test createInstance() {
        if (count<10){
            count++;
            return new Test();
        }
        else {
            return null;
        }    
    }
}