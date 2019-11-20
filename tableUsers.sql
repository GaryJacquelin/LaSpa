
CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(250) NOT NULL,
  `last_update` date DEFAULT NULL,
  `user_update` date DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `id_visiteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `last_update`, `user_update`, `role`,`id_visiteur` ) VALUES
(1, 'admin', 'alain@free.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2015-10-12', '2015-10-12', 'admin',1),
(2, 'cvial', 'pierre@free.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2015-10-12', '2015-10-12', 'admin',2),
(3, 'scol', 'paul@free.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2015-10-12', '2015-10-12', 'admin',3),
(4, 'tut', 'serge@free.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2015-10-12', '2015-10-12', 'admin',4),
(5, 'valerie', 'valerie@email.com', '$2y$10$r9QRClqYVbhySUIye2f2G.t0ML0LvkVpWE95USQpEIM4i5hzUynLm', '2015-10-12', '2015-10-12', 'admin',5);
  
  ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `visiteur`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;