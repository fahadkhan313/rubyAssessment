require 'json'
$shoe = Hash.new
$cloth = Hash.new
puts "welcome to the webkorps shoes and cloth centre "
print "please specify who you are : "
whoAmI = gets.chomp
flag = false
case whoAmI 
    when "owner"
        print "for security purpose please enter password : "
        passWd = gets.chomp
        if(passWd=="Webkorps@123")
            puts "hello sir here you can add items to the stock please select shoe or cloth"
            itemName = gets.chomp
            ptr = 1
            while(ptr<6)
                if(itemName=="shoe")
                    puts "please enter the brand name for shoe #{ptr}"
                    brandName = gets.chomp
                    size = {"S" => 5, 
                            "M" => 5, 
                            "L" => 5,
                            "XL" => 5, 
                            "XXL" => 5}
                    $shoe[brandName] = size
                elsif(itemName=="cloth")
                    puts "please enter the brand name for cloth #{ptr} "
                    brandName = gets.chomp
                    size = {"S" => 5, 
                            "M" => 5, 
                            "L" => 5,
                            "XL" => 5, 
                            "XXL" => 5}
                    $cloth[brandName] = size
                end
                ptr += 1
            end
            puts "okay max limit for brandnames reached"
        else
            puts "sorry wrong password "
            flag = true
        end
    else 
        puts "please enter 'owner' "
        flag = true
end

if(!flag)
    puts "consider yourself as customer from now on"
    puts "i guess you wanna buy something "
    print "specify what you wanna buy shoe or cloth : "
    whatToBuy = gets.chomp
    case whatToBuy
        when "shoe"
            puts "enter the brand name"
            brandNameForShoe = gets.chomp
            if(!($shoe.include?(brandNameForShoe)))
                puts "Not available"
                exit
            end
            puts "enter size"
            sizeForShoe = gets.chomp
            if($shoe[brandNameForShoe][sizeForShoe] >= 1)
                puts "Available in stock"
                puts "before buying item stock details are : "
                puts JSON.pretty_generate($shoe)
                $shoe[brandNameForShoe][sizeForShoe] = $shoe[brandNameForShoe][sizeForShoe] -1
                puts "after buying item stock details are : "
                puts JSON.pretty_generate($shoe)
            else
                puts "Out of stock"
            end
        when "cloth"
            puts "enter the brand name"
            brandNameForCloth = gets.chomp
            if(!($cloth.include?(brandNameForCloth)))
                puts "Not available"
                exit
            end
            puts "enter size"
            sizeForCloth = gets.chomp
            if($cloth[brandNameForCloth][sizeForCloth] >= 1)
                puts " Available in stock"
                puts "before buying item stock details are :  "
                puts JSON.pretty_generate($cloth)
                $cloth[brandNameForCloth][sizeForCloth] = $cloth[brandNameForCloth][sizeForCloth] -1
                puts "after buying item stock details are : "
                puts JSON.pretty_generate($cloth)
            else
                puts "Out of stock"
            end
        else
            puts "please enter either shoe or cloth no other values"
            exit
    end
end