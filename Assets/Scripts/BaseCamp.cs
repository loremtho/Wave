using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class BaseCamp : MonoBehaviour
{
    public Slider BaseHPSlider;
    public TextMeshProUGUI BaseHpTxt;
    public float MaxHP = 1000f;
    private float CurHP;

    private float BaseDecreaseTime;
    private float CurBaseDecreaseTime;

    private GameManager gameManager;

    private void Start() 
    {
        CurHP = MaxHP;
        BaseHPSlider.value = CurHP;
        BaseHpTxt.text = CurHP.ToString();
        gameManager = FindObjectOfType<GameManager>();
    }

    private void BaseCurHP(float newCurHP)
    {
        CurHP = newCurHP;
        BaseHPSlider.value = CurHP;
        BaseHpTxt.text = $"{CurHP} / {MaxHP}";
    }

    public void Heal(float healingAmount)
    {
        CurHP = Mathf.Min(CurHP, MaxHP); // 최대 체력을 넘지 않도록 제한
        if(CurHP + healingAmount < MaxHP)
        {
            CurHP += healingAmount;
        }
        else
        {
            CurHP = MaxHP;
        }

    }

    private void BaseDecrease(float DecreaseBase)
    {
        if (CurHP > 0)
        {
            if (CurBaseDecreaseTime <= BaseDecreaseTime)
            {
                CurBaseDecreaseTime++;
            }
            else
            {
                CurHP -= DecreaseBase; //DecreaseBase 만큼 베이스 체력을 감소시킴
                CurBaseDecreaseTime = 0;
            }

        }
        else
        {
            Debug.Log("베이스캠프 체력이 0이 되었습니다");
        }
    }

    public void IngBattle() // 스테이지가 실행중일때
    {
        if(gameManager.isBattle == true)
        {
            StartCoroutine(BaseHPDecreaseStart()); // 베이스캠프 자동체력감소 실행
        }
        else
        {
            StopCoroutine(BaseHPDecreaseStart()); // 종료
        }
    }

    public IEnumerator BaseHPDecreaseStart()
    {
        while (true)
        {
            yield return new WaitForSeconds(5f); // 5초 대기

            BaseDecrease(20f); // 5초마다 20씩 베이스캠프 체력을 감소시킴
        }
    }

    private void OnTriggerEnter(Collider other) 
    {
        if(other.CompareTag("Enemy"))
        {
            BaseDamage(50f);
        }
    }

    public void BaseDamage(float Damage)
    {
        CurHP -= Damage;
        CurHP = Mathf.Clamp(CurHP, 0, MaxHP);

        if(CurHP <= 0)
        {
            this.gameObject.SetActive(false);
            Debug.Log("베이스캠프가 파괴되었습니다!!");
        }
        else
        {
            Debug.Log("베이스캠프 체력 : " + CurHP);
        }
    }
    
    
}
