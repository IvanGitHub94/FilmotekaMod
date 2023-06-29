package com.jpc16tuesday.springlibraryproject.library.mapper;


import com.jpc16tuesday.springlibraryproject.library.dto.FilmDTO;
import com.jpc16tuesday.springlibraryproject.library.model.Film;
import com.jpc16tuesday.springlibraryproject.library.model.GenericModel;
import com.jpc16tuesday.springlibraryproject.library.repository.DirectorRepository;
import jakarta.annotation.PostConstruct;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
public class FilmMapper
        extends GenericMapper<Film, FilmDTO> {
    private final DirectorRepository directorRepository;

    private final DirectorMapper directorMapper;

    protected FilmMapper(ModelMapper mapper, DirectorRepository directorRepository, DirectorMapper directorMapper) {
        super(Film.class, FilmDTO.class, mapper);
        this.directorRepository = directorRepository;
        this.directorMapper = directorMapper;
    }

    @PostConstruct
    @Override
    public void setupMapper() {
        modelMapper.createTypeMap(Film.class, FilmDTO.class)
                .addMappings(
                        mapping -> {
                            mapping.skip(FilmDTO::setDirectorIds);
                            mapping.skip(FilmDTO::setDirectorInfo);
                        })
                .setPostConverter(toDTOConverter());


        modelMapper.createTypeMap(FilmDTO.class, Film.class)
                .addMappings(mapping -> mapping.skip(Film::setDirectors)).setPostConverter(toEntityConverter());
    }

    @Override
    protected void mapSpecificFields(FilmDTO source, Film destination) {
        if (!Objects.isNull(source.getDirectorIds())) {
            destination.setDirectors(directorRepository.findAllById(source.getDirectorIds()));
        } else {
            destination.setDirectors(Collections.emptyList());
        }
    }

    @Override
    protected void mapSpecificFields(Film source, FilmDTO destination) {
        destination.setDirectorIds(getIds(source));
        destination.setDirectorInfo(directorMapper.toDTOs(source.getDirectors()));
    }

    @Override
    protected List<Long> getIds(Film film) {
        return Objects.isNull(film) || Objects.isNull(film.getDirectors())
                ? null
                : film.getDirectors().stream()
                .map(GenericModel::getId)
                .collect(Collectors.toList());
    }
}
