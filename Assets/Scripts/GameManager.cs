using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static bool isPause = false; // 메뉴가 호출되면 true; //변경
    
    public int stage;
    public bool isBattle;
    public GameObject StartZone; //스테이지 게임 시작존 관리

    //몬스터 관리*********************************
    public Transform[] enemyZone; 
    public GameObject[] enemies;
    public List<int> enemyList;

    //********************************

    /* 풀링 임시 예제
     public static GameManager instance; //생성 관리
    public int count;
    public Transform[] points;
    */

    float timer;
    bool isStop;

    public static bool isNight = false;
    public static bool isWater = false;


    private WeaponManager theWM;
    private bool flag = false;

    protected virtual void Awake()
    {
        //instance = this; 풀링 임시
    }

    void Start()
    {
        theWM = FindObjectOfType<WeaponManager>(); 
    }

    public void StageStart() //스테이지 시작시 원하는 오브젝트 비활성화 
    {
        StartZone.SetActive(false);
        isBattle = true;
        StartCoroutine(InBattle());

    }

    public void StageEnd()  //스테이지 끝난후 활성화
    {
        //플레이어 .transform.position = Vector3.up * 0.8f; 를 통해서 스테이지 끝난후 위치 바꾸는것도 가능

        StartZone.SetActive(true);
        isBattle = false;
        stage++;

    }

    IEnumerator InBattle()
    {
        yield return new WaitForSeconds(5);
        StageEnd();
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

        /* 풀링 임시
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
        */ 
    }
}
