using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    public static bool isPause = false; // 메뉴가 호출되면 true; //변경
    
    public int stage;

    public Text stageTxt;
    public bool isBattle;
    public GameObject StartZone; //스테이지 게임 시작존 관리

    public PlayerController player;

    //몬스터 관리*********************************
    public Transform[] enemyZone; 
    public GameObject[] enemies;
    public List<int> enemyList;

    //********************************


    float timer;
    bool isStop;

    public static bool isNight = false;
    public static bool isWater = false;


    private WeaponManager theWM;
    private bool flag = false;


    void Awake()
    {
        enemyList = new List<int>();

    }

    void Start()
    {
        
        theWM = FindObjectOfType<WeaponManager>(); 
    }

    public void StageStart() //스테이지 시작시 원하는 오브젝트 비활성화 
    {
        StartZone.SetActive(false);

        foreach(Transform zone in enemyZone) //게임 시작시 스폰 활성
        zone.gameObject.SetActive(true);


        isBattle = true;
        StartCoroutine(InBattle());

    }

    public void StageEnd()  //스테이지 끝난후 활성화
    {
        //플레이어 .transform.position = Vector3.up * 0.8f; 를 통해서 스테이지 끝난후 위치 바꾸는것도 가능

        StartZone.SetActive(true);

        foreach(Transform zone in enemyZone) //게임 시작시 스폰 비활성
        zone.gameObject.SetActive(false);

        isBattle = false;
        stage++;

    }

    IEnumerator InBattle()
    {
        for(int index = 0; index < stage; index++)
        {
            int ran = Random.Range(0 ,2); //존 개수 몬스터 늘릴시 갯수 수정
            enemyList.Add(ran);
        }
        while(enemyList.Count > 0)
        {
            int ranZone = Random.Range(0, 4); //몬스터 늘릴시 갯수 수정
            GameObject instantEnemy = Instantiate(enemies[enemyList[0]], enemyZone[ranZone].position, enemyZone[ranZone].rotation);
            Enemy enemy = instantEnemy.GetComponent<Enemy>();
            enemy.target = player.transform;
            enemyList.RemoveAt(0);
             yield return new WaitForSeconds(5);
        } 
       
    }

    /* 풀링 임시
    protected virtual void Spawn()
    {

    }

    public virtual void ReturnPool(Enemy clone)
    {

    }
    */

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

    void LateUpdate() 
    {
        stageTxt.text = "Wave " + stage + " / 5";
   
    }
}
