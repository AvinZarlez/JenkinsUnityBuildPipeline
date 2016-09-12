using UnityEngine;
using System.Collections;

public class BallMoveScript : MonoBehaviour {

    bool goingNorth = true;
    bool goingWest = true;

    public float speed;
    public float distance;

    // Use this for initialization
    void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        if ((transform.position.x <= -distance) || (transform.position.x >= distance)) goingWest = !goingWest;
        if ((transform.position.y <= -distance) || (transform.position.y >= distance)) goingNorth = !goingNorth;

        Vector3 goal = new Vector3(distance,-distance, 0);

        if (goingNorth) goal.y =  distance;
        if (goingWest)  goal.x = -distance;

        float step = speed * Time.deltaTime;
        transform.position = Vector3.MoveTowards(transform.position, goal, step);

    }
}
