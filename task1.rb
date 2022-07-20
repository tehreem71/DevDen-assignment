def climbingLeaderboard(new,final)
    num=1
    new.each_with_index do |element,i|
    #puts new[i]
    if new[i] == new[i + 1]  #checking consecutive same values
                            #for each element
        final[i]=num
        final[i + 1]=num     #assigning same rank to both
    else
       final[i]= num
       num=num+1      #if it isnt equal, give it next rank
    end
    #i += 1
    end
    #puts final
    return final
end
def rankingPlayer(leader_array,player,new,final)
    player_rank=0
l=[]

player.each_with_index do |element,i| 
    current=0
    new.push(player[i])
    s=new.sort
    n=s.reverse()
    l=climbingLeaderboard(n,final)
    v=n.select  {|val| val==player[i]}
    #puts v
    n.each_with_index do |ele,j|
        #puts v
        if n[j]==v[0]   #get array index for Alice's score
            #puts j
            current=j
        end
    end
    puts"Alice's rank after game #{i+1} and score #{v}:"
    puts l[current]  #give current rank for current score
    new.pop()  #removes last added element(alice's score)
    #and continues ranking them
end
end
#########MAIN CODE############
ranks=[]
player=[]
n=0
m=0
##input &constraints for board "n" and leaderboardscores "ranked"##
loop do   
  puts "Enter no. of players on Leaderboard:" 
  n=gets.to_i   
  if n>=1 && n < 200000   
    loop do   
  puts "Enter Leaderboard scores in Descending order:"  
  ranks = gets.split(' ').map &:to_i  
  s=ranks.sort.reverse() #ascending order, to reverse in condition
  if ranks.count!=n || ranks!=s || ranks.any? {|i| i>=1000000000 || i<0}
      puts"!! Incorrect no. or order of elements in array !!"
    puts"Please enter scores again"
    puts"-----------------------------"
    
  else
    break 
  end   
    end
  break
  else
    puts"!! Incorrect input !!"
    puts"Please enter no. of players again"
    puts"-----------------------------"
  end   
end
###input &constraints for games "m" and player array "player"####
loop do   
  puts "Enter no. of games played by Alice:" 
  m=gets.to_i   
  if m>=1 && m < 200000   
    loop do   
  puts "Enter game scores in Ascending order:"  
  player = gets.split(' ').map &:to_i  
  so=player.sort #ascending order
  if player.count!=m || player!=so || player.any? {|i| i>=1000000000 || i<0}
      
    puts"!! Incorrect no. or order of elements in array !!"
    puts"Please enter scores again"
    puts"-----------------------------"
  else
      break 
  end   
    end
  break
  else
    puts"!! Incorrect input !!"
    puts"Please enter no. of players again"
    puts"-----------------------------"
  end   
end

# sorting in case of jagged input
sorted=ranks.sort
new=sorted.reverse()
player=player.sort()
puts "Leaderboard Scores:"
puts new
final=[]  #array for storing ranks of leaderboard
########## set leaderboard rankings ###########
leader_array=climbingLeaderboard(new,final) 
puts "Leaderboard Ranks in order of highest to lowest"
puts leader_array
######### player rank checking ###############
rankingPlayer(leader_array,player,new,final)
