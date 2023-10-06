using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public static class TransformExtensions //플레이어 자식 오브젝트 탐색 클래스
{
    
    public static Transform FindDeepChild(this Transform parent, string name)
    {
        Transform result = parent.Find(name);
        if (result != null)
            return result;
        foreach (Transform child in parent)
        {
            result = child.FindDeepChild(name);
            if (result != null)
                return result;
        }
        return null;
    }
}

public class GameManager : MonoBehaviour
{

    //상태 변수
    public static bool isPause = false; // 메뉴가 호출되면 true; //변경
    public bool isBattle;
    public static bool isNight = false;
    public static bool isWater = false;
    private bool flag = false;
    bool isStop;

    //인게임 UI***********************
    public int stage;
    public Text stageTxt;
    public Text scoreTxt;
    public Text playTimeTxt;
    public Text hitscoreTxt;
    public Text killcountTxt;
    public float playTime;
    float timer;
    //클리어 캔버스 UI*****************

    public Text LastscoreTxt;
    public Text LastplayTimeTxt;
    public Text LasthitscoreTxt;
    public Text LastkillcountTxt;
    public float LastplayTime;

    //********************************
   
    public GameObject StartZone; //스테이지 게임 시작존 관리

    //몬스터 관리***********************
    public Transform[] enemyZone; 
    public GameObject[] enemies;
    public List<int> enemyList;

    //*********************************
    
    //필요한 컴포넌트
    public PlayerController player;
    private WeaponManager theWM;

    public WeaponChanger weaponchanger; //무기 변경 스크립트

    void Awake()
    {
        enemyList = new List<int>();
    }


    void Start()
    {
        
        theWM = FindObjectOfType<WeaponManager>(); 
        
        //weaponchanger.GunA(); //플레이어 무기 타입 결정 임시
        
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

         StageEnd();
       
    }

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

        if(isBattle)
        {
            playTime += Time.deltaTime;
        }


        return;

   
    }


    void LateUpdate() 
    {
        stageTxt.text = "Wave " + stage + " / 5";

        scoreTxt.text = string.Format("Score : {0:n0}",player.score);

        hitscoreTxt.text = string.Format("Hit : {0:n0}",player.hitscore);

        killcountTxt.text = string.Format("Kill : {0:n0}",player.killcount);

        int hour = (int)(playTime / 3600);
        int min = (int)((playTime - hour * 3600) /60);
        int second = (int)(playTime % 60);
        playTimeTxt.text = string.Format("{0 : 00}", hour) + ":" + string.Format("{0 : 00}", min) + ":" + string.Format("{0 : 00}", second);
   
    }

    void LastUi() //클리어시 출력 클리어 UI
    {
         LastscoreTxt.text = string.Format("Score : {0:n0}",player.score);

        LasthitscoreTxt.text = string.Format("Hit : {0:n0}",player.hitscore);

        LastkillcountTxt.text = string.Format("Kill : {0:n0}",player.killcount);

    }
}
