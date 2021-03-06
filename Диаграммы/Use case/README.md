# Содержание
1. [Диаграмма прецедентов](#1)<br>
1.1 [Актеры](#1.1)<br>
1.2 [Варианты использования](#1.2)<br>
1.2.1 [Добавить базовую задачу](#1.2.1)<br>
1.2.2 [Добавить приоритетную задачу](#1.2.2)<br>
1.2.3 [Добавить MasterTask](#1.2.3)<br>
1.2.4 [Удаление задачи](#1.2.4)<br>    
    
## 1. Диаграмма прецедентов<a name="1"></a> 

![Диаграмма прецедентов](https://github.com/LiL-Dicky/Task-Master/blob/main/Диаграммы/Use%20case/Use_Case_Diagram.png)


## 1.1 Актёры<a name="1.1"></a>

| Актёр | Описание |
|:--|:--|
| Пользователь | Человек, использующий приложение |

## 1.2 Варианты использования<a name="1.2"></a>

#### 1.2.1 Добавить базовую задачу<a name="1.2.1"></a>
**Описание.** Вариант использования "Добавить базовую задачу" позволяет пользователю добавить в список базовую задачу.

Поток выполнения:
1. Пользователь нажимает на кнопку "+".
2. Во всплывшем окне с отображенными вариантами возможных для саздания типов задач, пользователь нажимает на "Daily task".
3. В новом всплывшем окне редактирования пользователь добавляет описание задачи.
4. Пользователь нажимает кнопку "accept", в следствии чего задача добавиться в список 
5. Конец.

#### 1.2.2 Добавить приоритетную задачу<a name="1.2.2"></a>
**Описание.** Вариант использования "Добавить приоритетную задачу" позволяет пользователю добавить в список приоритетную задачу.

Поток выполнения:
1. Пользователь нажимает на кнопку "+".
2. Во всплывшем окне с отображенными вариантами возможных для саздания типов задач, пользователь нажимает на "Priority task".
3. В новом всплывшем окне редактирования пользователь добавляет описание задачи, срок ее выполнения.
4. Пользователь нажимает кнопку "accept", в следствии чего задача добавиться в список 
5. Конец.

#### 1.2.3 Добавить MasterTask<a name="1.2.3"></a>
**Описание.** Вариант использования "Добавить Master Task" позволяет пользователю добавить в список усложненную задачу.

Поток выполнения:
1. Пользователь нажимает на кнопку "+".
2. Во всплывшем окне с отображенными вариантами возможных для саздания типов задач, пользователь нажимает на "Master task".
3. В новом всплывшем окне редактирования пользователь определяет количество подзадач.
4. После нажатья кнопки "accept", в поиявившемя окне со списком пустых задач, пользователь, нажатием на каждкю из них открывает окно редактирования подзадач.
5. Задает всем подзадачам описание и срок выполнения.
6. Пользователь нажимает кнопку "accept", в следствии чего задача добавиться в список
7. Конец.

#### 1.2.4 Удаление задачи<a name="1.2.4"></a>
**Описание.** Позволяет пользователю добавить новую путевую точку.

Поток выполнения:
1. Пользователь нажимет и удерживает задачу из списка, которую он хочет удалить.
2. Во всплывшем окне выбирает удаление задачи.
3. Конец.
