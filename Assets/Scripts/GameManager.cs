using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
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
    //배터리 스폰 관리*******************

    public GameObject Battery_prefab;
    public Transform[] battery_trans;
    private List<GameObject> Battery_prefab_Ins = new List<GameObject>();

    //*********************************
    
    //필요한 컴포넌트
    public PlayerController player;
    private WeaponManager theWM;
    public BaseCamp baseCamp;

    public WeaponChanger weaponchanger; //무기 변경 스크립트

    void Awake()
    {
        enemyList = new List<int>();
    }


    void Start()
    {
        
        theWM = FindObjectOfType<WeaponManager>();
        baseCamp = GetComponent<BaseCamp>();
        
        //weaponchanger.GunA(); //플레이어 무기 타입 결정 임시
        
    }

    public void StageStart() //스테이지 시작시 원하는 오브젝트 비활성화 
    {
        StartZone.SetActive(false);

        foreach(Transform zone in enemyZone) //게임 시작시 스폰 활성
        zone.gameObject.SetActive(true);
        BatteryRespawner(); // 게임 시작시 배터리 스폰시킴
        isBattle = true;

    }

    public void StageEnd()  //스테이지 끝난후 활성화
    {
        //플레이어 .transform.position = Vector3.up * 0.8f; 를 통해서 스테이지 끝난후 위치 바꾸는것도 가능

        StartZone.SetActive(true);

        foreach(Transform zone in enemyZone) //게임 시작시 스폰 비활성
        zone.gameObject.SetActive(false);
        foreach(var prefabInstance in Battery_prefab_Ins) // 스테이지 종료 시 생성한 배터리 프리펩 전부 파괴
        {
            Destroy(prefabInstance);
        }
        Battery_prefab_Ins.Clear(); // 리스트 비워서 중복 파괴 방지
        isBattle = false;
        baseCamp.EndDecreaseBaseHP();
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

    public void LastUi() //클리어시 출력 클리어 UI
    {
         LastscoreTxt.text = string.Format("Score : {0:n0}",player.score);

        LasthitscoreTxt.text = string.Format("Hit : {0:n0}",player.hitscore);

        LastkillcountTxt.text = string.Format("Kill : {0:n0}",player.killcount);

    }

    public void StageCheck()// 스테이지 상태 체크 함수
    {
        // 아니면 스테이지가 6에 진입되면 바로 클리어 시켜버려도 됨
        
        if(stage == 5 && baseCamp.CurHP > 0) //임시 조건 스테이지가 5에 도달하고 베이스캠프 체력이 0보다 클때
        {
            LastUi();
        }
        else if(stage <= 5 && baseCamp.CurHP <= 0) // 임시 조건 스테이지가 5이하이고 베이스캠프 체력이 0이하일때 
        {
            //실패창 띄우기
        }
        else
        {
            //결과창 실패창 모두 비활성화
        }
    }

    private void BatteryRespawner() //배터리 프리팹을 스폰시킴
    {
        int allSpawnPoint = battery_trans.Length;
        int BeSpawned = 0;
        for(int index = 0; index < stage; index++) //스테이지 마다 스폰시킴
        {
            foreach (Transform spawnPoint in battery_trans) //배열로 선언된 위치에 스폰함
            {
                var prefabInstance = Instantiate(Battery_prefab, spawnPoint.position, spawnPoint.rotation);
                Battery_prefab_Ins.Add(prefabInstance);
                BeSpawned++;
                if(BeSpawned >= allSpawnPoint)
                {
                    return;
                }
            }
        }
    }
}
