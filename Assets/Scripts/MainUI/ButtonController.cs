using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ButtonController : MonoBehaviour
{

    public GameObject ShopUI;

    private WeaponChanger weaponchanger; //무기 변경 스크립트

    public GameObject WeaponSelectionUI;

    public GameObject EndingUI;

    public GameManager gameManager;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.H))
        {
             inWeaponSelect();
        }

        if (Input.GetKeyDown(KeyCode.C))
        {
            inEnding();
        }
    }

    public void inGame()
    {
        LoadingSceneManager.LoadScene("TestScene");
    }

    public void inShop()
    {
        ShopUI.SetActive(true);
    }

    public void outShop()
    {
        ShopUI .SetActive(false);

    }

    public void inWeaponSelect()
    {
        WeaponSelectionUI.SetActive(true);
    }

    public void outWeaponSelect()
    {
        WeaponSelectionUI .SetActive(false);

    }

    public void SelectionGun()
    {
        weaponchanger.GunA();
        WeaponSelectionUI.SetActive(false);
    }

    public void SelectionAxe()
    {
         weaponchanger.AxeA();
         WeaponSelectionUI .SetActive(false);

    }

     public void inEnding()
    {
        EndingUI.SetActive(true);
        gameManager.LastUi();

    }

    public void outEnding()
    {
        EndingUI.SetActive(false);

    }

    public void HomeBtn()
    {
        SceneManager.LoadScene("Testmain");
    }

    public void RestartBtn()
    {
        SceneManager.LoadScene("TestScene");
    }
    
}
