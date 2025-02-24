<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Масленичные предсказания</title>
    <style>
        body {
            font-family: 'Georgia', serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background: url('https://img.freepik.com/premium-vector/maslenitsa-set-slavic-holiday_556150-220.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #5a3e36;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: rgba(255, 223, 186, 0.9);
            padding: 30px;
            border-radius: 50%;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            width: 90%;
            max-width: 400px;
            height: auto;
            min-height: 300px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #8b4513;
            text-shadow: 2px 2px 4px rgba(255, 223, 186, 0.5);
        }

        #prediction {
            font-size: 20px;
            margin: 15px 0;
            font-style: italic;
            text-align: center;
            color: #5a3e36;
            text-shadow: 1px 1px 2px rgba(255, 223, 186, 0.5);
            line-height: 1.5;
            max-width: 80%; /* Ограничиваем ширину текста */
            word-wrap: break-word; /* Перенос слов, если текст слишком длинный */
        }

        button {
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            background-color: #ff6f61;
            color: #fff;
            border: none;
            border-radius: 25px;
            transition: background-color 0.3s ease;
            margin-top: 15px;
        }

        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        button:hover:not(:disabled) {
            background-color: #ff3b2f;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .fade-in {
            animation: fadeIn 1s ease-in-out;
        }

        .container::before {
            content: '';
            position: absolute;
            top: -10px;
            left: -10px;
            right: -10px;
            bottom: -10px;
            border: 5px solid #ffd700;
            border-radius: 50%;
            z-index: -1;
        }

        /* Адаптация для мобильных устройств */
        @media (max-width: 600px) {
            h1 {
                font-size: 20px;
            }

            #prediction {
                font-size: 18px;
                max-width: 90%; /* Увеличиваем ширину текста на мобильных устройствах */
            }

            button {
                font-size: 16px;
                padding: 8px 16px;
            }

            .container {
                padding: 20px;
                border-radius: 40%;
                width: 80%;
                min-height: 250px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Масленичные предсказания</h1>
        <p id="prediction" class="fade-in">Нажмите на кнопку, чтобы получить предсказание!</p>
        <button onclick="getPrediction()" id="predictionButton">Получить предсказание</button>
    </div>

    <script>
        const predictions = [
            "Сегодня твой день!",
            "Удача на твоей стороне.",
            "Будь осторожен с решениями.",
            "Впереди ждет что-то прекрасное.",
            "Ожидай приятный сюрприз!",
            "Ты добьешься успеха!",
            "Сегодня все сложится идеально.",
            "Скоро ты получишь хорошие новости.",
            "Будь открыт для новых возможностей.",
            "Не бойся рисковать, удача на твоей стороне.",
            "Ты встретишь важного человека.",
            "Твои мечты начнут сбываться.",
            "Жизнь приготовила тебе подарок.",
            "Не упусти свой шанс сегодня.",
            "Все пойдет так, как ты задумал.",
            "Ты обретешь вдохновение.",
            "Успех ближе, чем ты думаешь.",
            "Сегодня отличный день для новых начинаний.",
            "Ожидай приятных неожиданностей.",
            "Ты на верном пути!",
            "Судьба улыбается тебе.",
            "Скоро все твои старания окупятся.",
            "Верь в себя, и у тебя все получится.",
            "Сегодня день, когда можно сделать первый шаг.",
            "Ты притягиваешь удачу.",
            "Будь смелым, и все получится.",
            "Сегодня тебе повезет в делах.",
            "Не бойся принимать важные решения.",
            "Скоро тебя ждет радостное событие.",
            "Ты станешь счастливее, чем был раньше.",
            "Сегодня день сюрпризов.",
            "Ты обретешь внутреннюю гармонию.",
            "Наступает благоприятный период в жизни.",
            "Жди успеха в ближайшие дни.",
            "Ты встретишь нового друга.",
            "Судьба ведет тебя к лучшему.",
            "Сегодня твои идеи будут особенно ценны.",
            "Жизнь подарит тебе шанс – используй его!",
            "Ты вдохновишь кого-то на важный поступок.",
            "Будь настойчив – и добьешься успеха.",
            "Не бойся перемен – они к лучшему.",
            "Твоя интуиция сегодня особенно сильна.",
            "В ближайшие дни тебя ждет приятный сюрприз.",
            "Ты сделаешь важный шаг вперед.",
            "Сегодня день для творчества и вдохновения.",
            "Ожидай признания своих заслуг.",
            "Ты найдешь ответ на важный вопрос.",
            "Скоро тебя ждет радость и удача.",
            "Ты раскроешь в себе новые таланты.",
            "Сегодня день возможностей.",
            "Ты получишь ценный опыт.",
            "Все идет к лучшему, доверься судьбе.",
            "Твои усилия скоро принесут плоды.",
            "Ты найдешь то, что давно искал.",
            "Скоро исполнятся твои желания.",
            "Открывайся новым впечатлениям.",
            "Ты сделаешь чью-то жизнь лучше.",
            "Сегодня день благоприятных изменений.",
            "Ты найдешь вдохновение в простых вещах.",
            "Жизнь готовит тебе приятный подарок.",
            "Верь в себя – и все получится!",
            "Сегодня тебя ждет особенный момент.",
            "Ты становишься сильнее с каждым днем.",
            "Не бойся мечтать – мечты сбываются.",
            "Ты найдешь неожиданный источник радости.",
            "В ближайшие дни тебя ждут положительные перемены.",
            "Сегодня твои идеи могут изменить мир.",
            "Ты вдохновишь кого-то своим примером.",
            "Будь готов к новым возможностям.",
            "Ты станешь счастливее, чем был вчера.",
            "Сегодня удача на твоей стороне.",
            "Не сомневайся в своих силах.",
            "Жизнь полна сюрпризов – наслаждайся!",
            "Ты сможешь преодолеть все преграды.",
            "Сегодня твои решения будут особенно удачными.",
            "Будь благодарен за все хорошее, что у тебя есть.",
            "Ты обретешь покой и счастье.",
            "Жди неожиданного, но приятного известия.",
            "Ты найдешь новый смысл в привычных вещах."
        ];

        function getPrediction() {
            const randomIndex = Math.floor(Math.random() * predictions.length);
            const predictionElement = document.getElementById("prediction");
            const predictionButton = document.getElementById("predictionButton");

            predictionElement.textContent = predictions[randomIndex];
            predictionElement.classList.add("fade-in");

            // Делаем кнопку неактивной после получения предсказания
            predictionButton.disabled = true;
            predictionButton.textContent = "Предсказание получено";
        }
    </script>
</body>
</html>
