package utdhack;
import java.util.ArrayList;


public class attractionList {
	ArrayList<Domain> List;
	public float Time;
	public float Cost;
	public int MaxId = 0;
	public attractionList() {
		List = new ArrayList<Domain>();
		Time  = 0 	; 
		Cost = 0	;
	}
	public attractionList(Domain a) {
		List = new ArrayList<Domain>();
		List.add(a);
		MaxId = a.getId();
		Time  = a.getTimeSpent()	; 
		Cost = a.getCost()	;
	}

	public void add(Domain a){
		if(!List.contains(a))
			{
			List.add(a);
			Time += a.getTimeSpent();
			Cost += a.getCost();
				if(MaxId< a.getId()) MaxId = a.getId();
			}
	}
	public boolean isInList(Domain a)
	{
		return List.contains(a);
	}
	public attractionList(attractionList previousList)
	{
		List = new ArrayList<Domain>();
		Time = previousList.Time	; 
		Cost = previousList.Cost	;
		MaxId = previousList.MaxId;
		for(int i = 0 ; i  < previousList.List.size() ; i ++)
		{
			List.add(previousList.List.get(i));
		}
	}
	public boolean canAdd(Domain a, float TimeConstraint, float CostConstraint){
		if(Time + a.getTimeSpent() <= TimeConstraint && Cost + a.getCost() <= CostConstraint )
			return true;
		return false;
	}
	public Domain get(int index){
		if(index < List.size())
			return List.get(index);
		else
			return null;
	}
	public int size(){
		return List.size();
	}
}
