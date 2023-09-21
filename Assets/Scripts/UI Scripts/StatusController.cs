using Mono.Cecil;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StatusController : MonoBehaviour
{
    // Start is called before the first frame update
    //체력
    [SerializeField]
    private int hp;
    private int currentHp;

    //스테미나
    [SerializeField]
    private int sp;
    private int currentSp;

    //스테미나 증가량
    [SerializeField]
    private int spIncreaseSpeed;

    [SerializeField]
    private int spRechargeTime;
    private int currentSpRechargeTime;

    //스태미나 감소 여부.
    private bool spUsed;

    //방어력
    [SerializeField]
    private int dp;
    private int currentDp;

    //배고품
    [SerializeField]
    private int hungry;
    private int currentHungry;

    //배고품이 줄어드는 속도
    [SerializeField]
    private int hungryDecreaseTime;
    private int currentHungryDecreaseTime;

    //목마름
    [SerializeField]
    private int thirsty;
    private int currentThirsty;

    //목마름이 줄어드는 속도
    [SerializeField]
    private int thirstyDecreaseTime;
    private int currentThirstyDecreaseTime;

    //만족도
    [SerializeField]
    private int satisfy;
    private int currentSatisfy;

    //필요한 이미지
    [SerializeField]
    private Image[] images_Gauge;
    /*[SerializeField]
    private Slider hpbar;
    [SerializeField]
    private Slider spbar;
    [SerializeField]
    private Slider dpbar;*/

    private const int HP = 0, DP = 1, SP = 2, HUNGRY = 3, THIRSTY = 4, SATISFY = 5;



    void Start()
    {
        currentHp = hp;
        currentDp = dp;
        currentSp = sp;
        /*currentHungry = hungry;
        currentThirsty = thirsty;
        currentSatisfy= satisfy;*/
    }

    // Update is called once per frame
    void Update()
    {
        //Hungry();
        //Thirsty();
        SPRechargeTime();
        SPRecover();
        GaugeUpdate();
        //BarValue();
    }


    private void SPRechargeTime()
    {
        if(spUsed)
        {
            if(currentSpRechargeTime < spRechargeTime)
            {
                currentSpRechargeTime++;

            }
            else
            {
                spUsed = false;
            }
        }
    }

    private void SPRecover()
    {
        if(!spUsed && currentSp < sp)
        {
            currentSp += spIncreaseSpeed;
        }
    }
    /*private void Hungry()
    {
        if(currentHungry > 0)
        {
            if (currentHungryDecreaseTime <= hungryDecreaseTime)
            {
                currentHungryDecreaseTime++;
            }
            else
            {
                currentHungry--;
                currentHungryDecreaseTime= 0;
            }

           
        }
        else
        {
            Debug.Log("배고픔 수치가 0이 되었습니다");
        }
    }

    private void Thirsty()
    {
        if (currentThirsty > 0)
        {
            if (currentThirstyDecreaseTime <= thirstyDecreaseTime)
            {
                currentThirstyDecreaseTime++;
            }
            else
            {
                currentThirsty--;
                currentThirstyDecreaseTime = 0;
            }


        }
        else
        {
            Debug.Log("목마름 수치가 0이 되었습니다");
        }
    }*/

    private void GaugeUpdate()
    {
        
        images_Gauge[HP].fillAmount = (float)currentHp / hp;
        images_Gauge[SP].fillAmount = (float)currentSp / sp;
        images_Gauge[DP].fillAmount = (float)currentDp / dp;
        /*images_Gauge[HUNGRY].fillAmount = (float)currentHungry / hungry;
        images_Gauge[THIRSTY].fillAmount = (float)currentThirsty / thirsty;
        images_Gauge[SATISFY].fillAmount = (float)currentSatisfy / satisfy;*/
        //배고픔 코드

    }

    /*private void BarValue()
    {
        hpbar.value = Mathf.Lerp(hpbar.value, currentHp / hp, Time.deltaTime * 10f);
        spbar.value = Mathf.Lerp(spbar.value, currentSp / sp, Time.deltaTime * 10f);
        dpbar.value = Mathf.Lerp(dpbar.value, currentDp / dp, Time.deltaTime * 10f);
        // 슬라이더 부드럽게 감소시키기
    }*/

    public void IncreaseHP(int _count)
    {
        if(currentHp + _count <hp)
        {
            currentHp += _count;
        }
        else
        {
            currentHp = hp;
        }
    }

    public void DecreaseHP(int _count)
    {
        if(currentDp > 0)
        {
            DecreaseDP(_count);
            return;
        }

        currentHp-= _count;

        if(currentHp <= 0)
        {
            //게임 오버 시키자
        }
    }

    public void IncreaseSP(int _count)
    {
        if (currentSp + _count < SP)
        {
            currentSp += _count;
        }
        else
        {
            currentSp = sp;
        }
    }


    public void IncreaseDP(int _count)
    {
        if (currentDp + _count < DP)
        {
            currentDp += _count;
        }
        else
        {
            currentDp = dp;
        }
    }

    public void DecreaseDP(int _count)
    {
        currentDp -= _count;

        if (currentDp <= 0)
        {
            //방어력 0
        }
    }

    /*public void IncreaseHungry(int _count)
    {
        if (currentHungry + _count < hungry)
        {
            currentHungry += _count;
        }
        else
        {
            currentHungry = hungry;
        }
    }

    public void DecreaseHungry(int _count)
    {
        if(currentHungry - _count < 0)
        {
            currentHungry = 0;
        }
        else
        {
            currentHungry -= _count;
        }
      
    }

    public void IncreaseThirsty(int _count)
    {
        if (currentHungry + _count < thirsty)
        {
            currentThirsty += _count;
        }
        else
        {
            currentThirsty = thirsty;
        }
    }

    public void DecreaseThirsty(int _count)
    {
        if (currentThirsty - _count < 0)
        {
            currentThirsty = 0;
        }
        else
        {
            currentThirsty -= _count;
        }

    }*/



    public void DecreaseStamina(int _count)
    {
        spUsed = true;
        currentSpRechargeTime= 0;

        if(currentSp - _count > 0)
        {
            currentSp -= _count;
        }
        else
        {
            currentSp = 0;
        }
    }

    public int GetCurrentSP()
    {
        return currentSp;
    }

}

