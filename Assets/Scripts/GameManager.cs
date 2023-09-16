using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static bool isPause = false; // 메뉴가 호출되면 true; //변경
    public static GameManager instance;
    
    public int count;
    public Transform[] points;

    float timer;
    bool isStop;

    public static bool isNight = false;
    public static bool isWater = false;


    private WeaponManager theWM;
    private bool flag = false;

    protected virtual void Awake()
    {
        instance = this;
    }

    void Start()
    {
        theWM = FindObjectOfType<WeaponManager>(); 
    }

    protected virtual void Spawn()
    {

    }

    public virtual void ReturnPool(Enemy clone)
    {

    }

    // Update is called once per frame
    void Update()
    {
        if(isWater)
        {
            if(!flag)
            {
                StopAllCoroutines();
                StartCoroutine(theWM.WeaponInCoroutine());
                flag = true;
            }
        }
        else
        {
            if(flag)
            {
                flag = false;
                theWM.WeaponOut();
            }
        }

        if(isStop)
        return;

        timer += Time.deltaTime;

        if(timer > 0.1f)
        {
            timer = 0f;
            count++;
            Spawn();
        }

        if(count == 1000)
        {
            Time.timeScale = 0.05f;
            isStop = true;
        }
    }
}
